library(condmixt)


### Name: condmixt.fit
### Title: Maximum likelihood estimation for conditional mixture parameters
### Aliases: condmixt.fit condhparetomixt.fit condhparetomixt.fit.tailpen
###   condhparetomixt.dirac.fit condhparetomixt.dirac.fit.tailpen
###   condgaussmixt.fit condgaussmixt.dirac.fit condlognormixt.fit
###   condlognormixt.dirac.fit condbergamixt.fit

### ** Examples

n <- 200
x <- runif(n) # x is a random uniform variate
# y depends on x through the parameters of the Frechet distribution
y <- rfrechet(n,loc = 3*x+1,scale = 0.5*x+0.001,shape=x+1)

plot(x,y,pch=22)
# 0.99 quantile of the generative distribution
qgen <- qfrechet(0.99,loc = 3*x+1,scale = 0.5*x+0.001,shape=x+1)
points(x,qgen,pch="*",col="orange")

h <- 2 # number of hidden units
m <- 4 # number of components

# initialize a conditional mixture with hybrid Pareto components
thetainit <- condhparetomixt.init(1,h,m,y)

# MLE for initial neural network parameters
condhparetomixt.fit(thetainit,h,m,t(x),y,iterlim=100)



