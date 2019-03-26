library(condmixt)


### Name: condmixt.fwd
### Title: Forward pass in neural network conditional mixtures
### Aliases: condmixt.fwd condhparetomixt.fwd condhparetomixt.dirac.fwd
###   condgaussmixt.fwd condgaussmixt.dirac.fwd condbergamixt.fwd

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

params.mixt <- condhparetomixt.fwd(thetainit,h,m,t(x)) # compute mixture parameters




