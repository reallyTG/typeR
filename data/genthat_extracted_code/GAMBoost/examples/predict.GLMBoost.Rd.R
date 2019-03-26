library(GAMBoost)


### Name: predict.GLMBoost
### Title: Predict method for GLMBoost fits
### Aliases: predict.GLMBoost
### Keywords: models regression

### ** Examples

##  Generate some data 
x <- matrix(runif(100*8,min=-1,max=1),100,8)             
eta <- -0.5 + 2*x[,1] + 4*x[,3]
y <- rbinom(100,1,binomial()$linkinv(eta))

##  Fit the model with only linear components
gb1 <- GLMBoost(x,y,penalty=100,stepno=100,trace=TRUE,family=binomial()) 

##  Extract predictions

#   at final boosting step
predict(gb1,type="response")

#   at 'optimal' boosting step (with respect to AIC)
predict(gb1,at.step=which.min(gb1$AIC),type="response")

#   matrix with predictions at predictor level for all boosting steps
predict(gb1,at.step=1:100,type="link")



