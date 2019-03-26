library(simrel)


### Name: simrel
### Title: Function for data simulation
### Aliases: simrel
### Keywords: Simulation Model

### ** Examples

#Linear model data, large n, small p
mydata <- simrel(n=250, p=20, m=2, q=5, relpos=c(2,4), gamma=0.25, R2=0.75 )

#Estimating model parameters using ordinary least squares
lmfit <- lm(mydata$Y ~ mydata$X)
summary(lmfit)

#Comparing true with estimated regression coefficients
plot(mydata$beta, lmfit$coef[-1],xlab="True regression coefficients", 
  ylab="Estimated regression coefficients")
abline(0,1)

#Linear model data, small n, large p
mydata <- simrel(n=50, p=200, m=2, q=25, relpos=c(2,4), gamma=0.25, R2=0.8 )

#Estimating model parameters using partial least squares regression with
#cross-validation to determine the number of relevant components.
require(pls)
plsfit <- plsr(mydata$Y ~ mydata$X, 15, validation="CV")

#Validation plot and finding the number of relevant components.
plot(0:15, c(plsfit$validation$PRESS0,plsfit$validation$PRESS), 
  type="b", xlab="Components", ylab="PRESS")
mincomp <- which(plsfit$validation$PRESS==min(plsfit$validation$PRESS))

#Comparing true with estimated regression coefficients
plot(mydata$beta, plsfit$coef[,1,mincomp],xlab="True regression coefficients", 
  ylab="Estimated regression coefficients")
abline(0,1)




