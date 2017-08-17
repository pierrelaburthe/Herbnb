class OrdersController < ApplicationController

  before_action :set_article, only: [ :create, :index]
  attr_accessor :confirm

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def create
    @order = Order.new(quantity: params[:order][:quantity].to_i, confirmed: false, delivered: false,
                       article_id: @article.id, user_id: current_user.id)
    @order.save
    # @orders = Order.where(User.find(@article.id) = current_user.id)
    redirect_to article_orders_path(@article.id)
  end

  # def confirm(order)
  #   if order.confirmed
  #     "confirmed"
  #   else
  #     "pending"
  #   end
  # end

  # def order_buy
  #   @orders = Order.where(User.find(@article) = current_user)
  # end

  # def order_sell

  # end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

end
