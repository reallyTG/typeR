library(condmixt)


### Name: condmixt.quant
### Title: Quantile computation for conditional mixtures.
### Aliases: condmixt.quant condhparetomixt.quant
###   condhparetomixt.dirac.quant condhparetomixt.dirac.condquant
###   condgaussmixt.quant condgaussmixt.dirac.quant
###   condgaussmixt.dirac.condquant condlognormixt.quant
###   condlognormixt.dirac.quant condlognormixt.dirac.condquant
###   condbergamixt.quant

### ** Examples

# generate train data
ntrain <- 200
xtrain <- runif(ntrain)
ytrain <- rfrechet(ntrain,loc = 3*xtrain+1,scale =
0.5*xtrain+0.001,shape=xtrain+2)
plot(xtrain,ytrain,pch=22) # plot train data
qgen <- qfrechet(0.99,loc = 3*xtrain+1,scale = 0.5*xtrain+0.001,shape=xtrain+2)
points(xtrain,qgen,pch="*",col="orange")

# generate test data
ntest <- 200
xtest <- runif(ntest)
ytest <- rfrechet(ntest,loc = 3*xtest+1,scale =
0.5*xtest+0.001,shape=xtest+2)

h <- 2 # number of hidden units
m <- 4 # number of components

# train a mixture with hybrid Pareto components
thetaopt <- condhparetomixt.train(h,m,t(xtrain),ytrain, nstart=2,iterlim=100)
qmod <- condhparetomixt.quant(thetaopt,h,m,t(xtest),0.99,0,10,trunc=TRUE)
points(xtest,qmod,pch="o",col="blue")




