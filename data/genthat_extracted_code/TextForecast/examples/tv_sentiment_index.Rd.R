library(TextForecast)


### Name: tv_sentiment_index
### Title: tv sentiment index function
### Aliases: tv_sentiment_index

### ** Examples

set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[,2])
w=as.matrix(stock_data[,3])
data("news_data")
X=news_data[,2:ncol(news_data)]
x=as.matrix(X)
grid_alphas=0.25
cont_folds=TRUE
t=length(y)
optimal_alphas=optimal_alphas(x[1:(t-1),],w[1:(t-1),],
y[2:t],grid_alphas,TRUE,"gaussian")
tv_index <- tv_sentiment_index(x[1:(t-1),],w[1:(t-1),],y[2:t],
optimal_alphas[[1]],optimal_alphas[[2]],x,"gaussian",2)




