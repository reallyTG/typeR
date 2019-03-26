library(greybox)


### Name: graphmaker
### Title: Linear graph construction function
### Aliases: graphmaker
### Keywords: graph linear plots

### ** Examples


x <- rnorm(100,0,1)
values <- forecast(arima(x),h=10,level=0.95)

graphmaker(x,values$mean,fitted(values))
graphmaker(x,values$mean,fitted(values),legend=FALSE)
graphmaker(x,values$mean,fitted(values),values$lower,values$upper,level=0.95)
graphmaker(x,values$mean,fitted(values),values$lower,values$upper,level=0.95,legend=FALSE)

# Produce the necessary ts objects from an arbitrary vectors
actuals <- ts(c(1:10), start=c(2000,1), frequency=4)
forecast <- ts(c(11:15),start=end(actuals)[1]+end(actuals)[2]*deltat(actuals),
               frequency=frequency(actuals))
graphmaker(actuals,forecast)




