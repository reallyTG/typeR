library(predtoolsTS)


### Name: modl
### Title: Building predictive models
### Aliases: modl

### ** Examples

p <- prep(AirPassengers)
modl(p,method='arima')
## No test: 
modl(p,method='dataMining',algorithm='rpart')
## End(No test)



