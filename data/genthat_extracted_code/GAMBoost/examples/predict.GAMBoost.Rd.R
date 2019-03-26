library(GAMBoost)


### Name: predict.GAMBoost
### Title: Predict method for GAMBoost fits
### Aliases: predict.GAMBoost
### Keywords: models smooth regression

### ** Examples

##  Generate some data 
x <- matrix(runif(100*3,min=-1,max=1),100,3)             
eta <- -0.5 + 2*x[,1] + 4*x[,3]^2
y <- rbinom(100,1,binomial()$linkinv(eta))

##  Fit the model with smooth components
gb1 <- GAMBoost(x,y,penalty=200,stepno=100,trace=TRUE,family=binomial()) 

##  Extract predictions

#   at final boosting step
predict(gb1,type="response")

#   at 'optimal' boosting step (with respect to AIC)
predict(gb1,at.step=which.min(gb1$AIC),type="response")

#   matrix with predictions at predictor level for all boosting steps
predict(gb1,at.step=1:100,type="link")




