class ArticlesController < ApplicationController
  include ArticlesHelper
  def new
    @article = Article.new(article_params)
  end

  def create
    #fail
    #@article = Article.new
    #@article.title = params[:article][:title]
    #@article = Article.new(
    #  title: params[:article][:title],
    #body: params[:article][:body])
    @article = Article.new(params[:article])
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article_id
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Destroyed!"
    redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end
end
