class Admin::OrdersController < Admin::AdminController
  before_filter :get_order, except: :index

  def index
    @orders = Order.page(params[:page]).most_recent
  end

  def fulfill
    @order.fulfill!
    redirect_to admin_orders_path
  end

  def unfulfill
    @order.unfulfill!
    redirect_to admin_orders_path
  end

  private

  def get_order
    @order = Order.where(order_number: params[:id]).first
  end
end