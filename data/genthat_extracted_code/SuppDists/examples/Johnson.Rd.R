library(SuppDists)


### Name: Johnson
### Title: The Johnson distributions
### Aliases: dJohnson pJohnson qJohnson rJohnson sJohnson moments
###   JohnsonFit
### Keywords: distribution

### ** Examples


xx<-rnorm(500)
parms<-JohnsonFit(xx)
sJohnson(parms)
plot(function(xx)dJohnson(xx,parms),-2,2)
pJohnson(1,parms)
parms2<-JohnsonFit(rexp(50))
qJohnson(p=0.5,list(parms,parms2))

## JohnsonFit with moment="find" and moment="use" is not always possible,
## and even when possible, may produce odd results.
## parms<-JohnsonFit(x,moment="find")

parms<-JohnsonFit(c(0,1,-.5,4),moment="use")

sJohnson(parms) 

# Fit illustration
data(cars)
xx<-cars$speed
parms<-JohnsonFit(xx)
hist(xx,freq=FALSE)
plot(function(x)dJohnson(x,parms),0,25,add=TRUE)





