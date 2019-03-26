library(predtoolsTS)


### Name: pred.compareModels
### Title: Compare different predictions
### Aliases: pred.compareModels

### ** Examples

## No test: 
data(AirPassengers)
#pre-processing
p <- prep(AirPassengers)
#modelling
arima.modl <- modl(p)
cart.modl <- modl(p,method='dataMining',algorithm='rpart')
#predicting
arima.pred <- pred(arima.modl,n.ahead=30)
cart.pred <- pred(cart.modl,n.ahead=45)
#post-processing
arima.pred <- postp(arima.pred,p)
cart.pred <- postp(cart.pred,p)
#visual comparison
pred.compareModels(AirPassengers,arima.pred$predictions,cart.pred$predictions
,legendNames=c('AirPassengers','ARIMA','CART'),yAxis='Passengers',legendPosition = 'topleft')
## End(No test)



