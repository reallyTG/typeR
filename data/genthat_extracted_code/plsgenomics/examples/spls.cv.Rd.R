library(plsgenomics)


### Name: spls.cv
### Title: Cross-validation procedure to calibrate the parameters (ncomp,
###   lambda.l1) of the Adaptive Sparse PLS regression
### Aliases: spls.cv

### ** Examples

## Not run: 
##D ### load plsgenomics library
##D library(plsgenomics)
##D 
##D ### generating data
##D n <- 100
##D p <- 100
##D sample1 <- sample.cont(n=n, p=p, kstar=10, lstar=2, 
##D                        beta.min=0.25, beta.max=0.75, mean.H=0.2, 
##D                        sigma.H=10, sigma.F=5, sigma.E=5)
##D                        
##D X <- sample1$X
##D Y <- sample1$Y
##D 
##D ### hyper-parameters values to test
##D lambda.l1.range <- seq(0.05,0.95,by=0.1) # between 0 and 1
##D ncomp.range <- 1:10
##D 
##D ### tuning the hyper-parameters
##D cv1 <- spls.cv(X=X, Y=Y, lambda.l1.range=lambda.l1.range, 
##D                ncomp.range=ncomp.range, weight.mat=NULL, adapt=TRUE, 
##D                center.X=TRUE, center.Y=TRUE, 
##D                scale.X=TRUE, scale.Y=TRUE, weighted.center=FALSE, 
##D                return.grid=TRUE, ncores=1, nfolds=10, nrun=1)
##D str(cv1)
##D 
##D ### otpimal values
##D cv1$lambda.l1.opt
##D cv1$ncomp.opt
## End(Not run)




