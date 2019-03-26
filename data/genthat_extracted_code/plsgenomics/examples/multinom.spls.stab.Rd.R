library(plsgenomics)


### Name: multinom.spls.stab
### Title: Stability selection procedure to estimate probabilities of
###   selection of covariates for the multinomial-SPLS method
### Aliases: multinom.spls.stab

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
##D 
##D X <- sample1$X
##D Y <- sample1$Y
##D 
##D ### pertinent covariates id
##D sample1$sel
##D 
##D ### hyper-parameters values to test
##D lambda.l1.range <- seq(0.05,0.95,by=0.1) # between 0 and 1
##D ncomp.range <- 1:10
##D # log-linear range between 0.01 a,d 1000 for lambda.ridge.range
##D logspace <- function( d1, d2, n) exp(log(10)*seq(d1, d2, length.out=n))
##D lambda.ridge.range <- signif(logspace(d1 <- -2, d2 <- 3, n=21), digits=3)
##D 
##D ### tuning the hyper-parameters
##D stab1 <- multinom.spls.stab(X=X, Y=Y, lambda.ridge.range=lambda.ridge.range, 
##D                             lambda.l1.range=lambda.l1.range, 
##D                             ncomp.range=ncomp.range, 
##D                             adapt=TRUE, maxIter=100, svd.decompose=TRUE, 
##D                             ncores=1, nresamp=100)
##D                        
##D str(stab1)
##D 
##D ### heatmap of estimated probabilities
##D stability.selection.heatmap(stab1)
##D 
##D ### selected covariates
##D stability.selection(stab1, piThreshold=0.6, rhoError=10)
## End(Not run)




