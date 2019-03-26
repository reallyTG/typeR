library(condmixt)


### Name: condmixt.nll
### Title: Negative log-likelihood for conditional mixtures
### Aliases: condmixt.nll condhparetomixt.nll condhparetomixt.nll.tailpen
###   condhparetomixt.dirac.nll condhparetomixt.dirac.nll.tailpen
###   condgaussmixt.nll condgaussmixt.dirac.nll condlognormixt.nll
###   condlognormixt.dirac.nll condbergamixt.nll

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

# computes negative log-likelihood and gradient for initial neural network parameters
condhparetomixt.nll(thetainit,h,m,t(x),y)




