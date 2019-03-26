library(condmixt)


### Name: condmixt.foldtrain
### Title: Training of conditional mixtures and evaluation of the negative
###   log-likelihood on validation data
### Aliases: condmixt.foldtrain condhparetomixt.foldtrain
###   condhparetomixt.foldtrain.tailpen
###   condhparetomixt.dirac.foldtrain.tailpen condgaussmixt.foldtrain
###   condgaussmixt.dirac.foldtrain condlognormixt.foldtrain
###   condlognormixt.dirac.foldtrain condbergamixt.foldtrain

### ** Examples

# generate train data
ntrain <- 200
xtrain <- runif(ntrain)
ytrain <- rfrechet(ntrain,loc = 3*xtrain+1,scale =
0.5*xtrain+0.001,shape=xtrain+1)
plot(xtrain,ytrain,pch=22) # plot train data
qgen <- qfrechet(0.99,loc = 3*xtrain+1,scale = 0.5*xtrain+0.001,shape=xtrain+1)
points(xtrain,qgen,pch="*",col="orange")

# generate test data
ntest <- 200
xtest <- runif(ntest)
ytest <- rfrechet(ntest,loc = 3*xtest+1,scale =
0.5*xtest+0.001,shape=xtest+1)

# create a matrix with sets of values for the number of hidden units and
# the number of components
hp <- matrix(c(2,4,2,2),nrow=2,ncol=2)

# train and test a mixture with hybrid Pareto components
condhparetomixt.foldtrain(t(xtrain),ytrain,t(xtest),ytest,hp,nstart=2,iterlim=100)



