class OrionController < ApplicationController
  def index
    @posts = Post.all.order("id desc")
  end

  def write
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to :back
  end

  def comment_create
    @comment = Comment.new(post_id:params[:post_id], content:params[:content])
    @comment.save
    redirect_to :back
  end

  def post_modify
    @target = Post.find(params[:post_id])
    @target.content = params[:content]
    @target.save
    redirect_to '/'
  end

  def comment_modify
    @target = Comment.find(params[:comment_id])
    @target.content = params[:content]
    @target.save
    redirect_to '/'
  end

  def delete
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to :back
  end

  def comment_delete
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to :back
  end
end
