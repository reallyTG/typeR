library(plsgenomics)


### Name: multinom.spls
### Title: Classification procedure for multi-label response based on a
###   multinomial model, solved by a combination of the multinomial Ridge
###   Iteratively Reweighted Least Squares (multinom-RIRLS) algorithm and
###   the Adaptive Sparse PLS (SPLS) regression
### Aliases: multinom.spls

### ** Examples

## Not run: 
##D ### load plsgenomics library
##D library(plsgenomics)
##D 
##D ### generating data
##D n <- 100
##D p <- 100
##D nclass <- 3
##D sample1 <- sample.multinom(n, p, nb.class=nclass, kstar=20, lstar=2, 
##D                            beta.min=0.25, beta.max=0.75, 
##D                            mean.H=0.2, sigma.H=10, sigma.F=5)
##D X <- sample1$X
##D Y <- sample1$Y
##D 
##D ### splitting between learning and testing set
##D index.train <- sort(sample(1:n, size=round(0.7*n)))
##D index.test <- (1:n)[-index.train]
##D 
##D Xtrain <- X[index.train,]
##D Ytrain <- Y[index.train,]
##D Xtest <- X[index.test,]
##D Ytest <- Y[index.test,]
##D 
##D ### fitting the model, and predicting new observations
##D model1 <- multinom.spls(Xtrain=Xtrain, Ytrain=Ytrain, lambda.ridge=2, 
##D                         lambda.l1=0.5, ncomp=2, Xtest=Xtest, adapt=TRUE, 
##D                         maxIter=100, svd.decompose=TRUE)
##D                      
##D str(model1)
##D 
##D ### prediction error rate
##D sum(model1$hatYtest!=Ytest) / length(index.test)
## End(Not run)




