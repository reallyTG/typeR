library(condmixt)


### Name: condmixt.init
### Title: Conditional mixture parameter initial values
### Aliases: condmixt.init condhparetomixt.init condhparetomixt.dirac.init
###   condgaussmixt.init condgaussmixt.dirac.init condlognormixt.init
###   condlognormixt.dirac.init condbergamixt.init

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



