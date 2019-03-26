library(GAMBoost)


### Name: plot.GAMBoost
### Title: Plots of the smooth functions from a GAMBoost fit
### Aliases: plot.GAMBoost
### Keywords: models smooth regression

### ** Examples

##  Generate some data 

x <- matrix(runif(100*8,min=-1,max=1),100,8)             
eta <- -0.5 + 2*x[,1] + 2*x[,3]^2
y <- rbinom(100,1,binomial()$linkinv(eta))

##  Fit the model with smooth components
gb1 <- GAMBoost(x,y,penalty=400,stepno=100,trace=TRUE,family=binomial()) 

##  Plot smooth components of fit

#   all, at final boosting step
par(mfrow=c(2,4))
plot(gb1)

#   components that received an update up to the 'optimal' boosting step

selected <- getGAMBoostSelected(gb1,at.step=which.min(gb1$AIC))

par(mfrow=c(1,length(selected$smooth)))
plot(gb1,select=selected$smooth)

#   components where the estimate at the 'optimal' boosting step does not
#   contain the null line
par(mfrow=c(1,length(selected$smoothbands)))
plot(gb1,select=selected$smoothbands)




