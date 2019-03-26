library(condmixt)


### Name: condhparetomixt.cvtrain.tailpen
### Title: Cross-validation of the conditinal mixture with hybrid Pareto
###   components with a tail penalty added to the negative log-likelihood
###   for training.
### Aliases: condhparetomixt.cvtrain.tailpen

### ** Examples

n <- 200
x <- runif(n) # x is a random uniform variate
 # y depends on x through the parameters of the Frechet distribution
y <- rfrechet(n,loc = 3*x+1,scale = 0.5*x+0.001,shape=x+1)

plot(x,y,pch=22)
# 0.99 quantile of the generative distribution
qgen <- qfrechet(0.99,loc = 3*x+1,scale = 0.5*x+0.001,shape=x+1)
points(x,qgen,pch="*",col="orange")

# create a matrix with sets of values for the number of hidden units and
# the number of components
hp <- matrix(c(2,4,2,2),nrow=2,ncol=2)

# keep tail penalty parameters constant
hp <- cbind(hp, rep(10,2),rep(0.5,2),rep(20,2),rep(0.2,2),rep(0.5,2))

condhparetomixt.cvtrain.tailpen(t(x), y, hp, nfold = 2, nstart = 2, iterlim=100)



