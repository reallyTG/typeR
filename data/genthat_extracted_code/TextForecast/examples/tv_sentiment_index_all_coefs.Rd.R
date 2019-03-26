library(TextForecast)


### Name: tv_sentiment_index_all_coefs
### Title: TV sentiment index using all positive and negative coefficients.
### Aliases: tv_sentiment_index_all_coefs

### ** Examples

suppressWarnings(RNGversion("3.5.0"))
set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[,2])
w=as.matrix(stock_data[,3])
data("news_data")
X=news_data[,2:ncol(news_data)]
x=as.matrix(X)
grid_alphas=0.05
cont_folds=TRUE
t=length(y)
optimal_alphas=optimal_alphas(x=x[1:(t-1),],
                              y=y[2:t],grid_alphas=grid_alphas,cont_folds=TRUE,family="gaussian")
tv_idx=tv_sentiment_index_all_coefs(x=x[1:(t-1),],y=y[2:t],alpha = optimal_alphas[1],
                                 lambda = optimal_alphas[2],newx=x,
                                 scaled = TRUE,k_mov_avg = 4,type_mov_avg = "s")



