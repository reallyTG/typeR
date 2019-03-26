library(TextForecast)


### Name: text_forecast
### Title: Text Forecast function
### Aliases: text_forecast

### ** Examples

set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[,2])
w=as.matrix(stock_data[,3])
data("news_data")
data("optimal_factors")
pc=optimal_factors
z=cbind(w,pc)
fcsts=text_forecast(z,y,1,TRUE)



