library(condmixt)


### Name: condmixt.train
### Title: Training of conditional mixtures
### Aliases: condmixt.train condhparetomixt.train
###   condhparetomixt.train.tailpen condhparetomixt.dirac.train.tailpen
###   condgaussmixt.train condgaussmixt.dirac.train condlognormixt.train
###   condlognormixt.dirac.train condbergamixt.train

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

# train a mixture with hybrid Pareto components
condhparetomixt.train(h,m,t(x),y,nstart=2,iterlim=100)



