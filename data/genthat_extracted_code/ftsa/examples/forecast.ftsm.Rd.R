library(ftsa)


### Name: forecast.ftsm
### Title: Forecast functional time series
### Aliases: forecast.ftsm
### Keywords: models

### ** Examples

# ElNino is an object of class sliced functional time series.
# Via functional principal component decomposition, the dynamic was captured 
# by a few principal components and principal component scores. 
# By using an exponential smoothing method, 
# the principal component scores are forecasted.
# The forecasted curves are constructed by forecasted principal components 
# times fixed principal components plus the mean function.	
forecast(object = ftsm(ElNino), h = 10, method = "ets")              
forecast(object = ftsm(ElNino, weight = TRUE))



