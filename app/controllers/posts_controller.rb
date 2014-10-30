class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.new(set_params)
    if @post.save
      render "show"
    else
      render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(set_params)
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_params
    params.require(:post).permit(:title, :author, :published, :content)
  end

end
