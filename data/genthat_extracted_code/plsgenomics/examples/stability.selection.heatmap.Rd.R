library(plsgenomics)


### Name: stability.selection.heatmap
### Title: Heatmap visualization of estimated probabilities of selection
###   for each covariate
### Aliases: stability.selection.heatmap

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
##D stab1 <- spls.stab(X=X, Y=Y, lambda.l1.range=lambda.l1.range, 
##D                    ncomp.range=ncomp.range, weight.mat=NULL, 
##D                    adapt=FALSE, center.X=TRUE, center.Y=TRUE, 
##D                    scale.X=TRUE, scale.Y=TRUE, weighted.center=FALSE, 
##D                    ncores=1, nresamp=100)
##D                        
##D str(stab1)
##D 
##D ### heatmap of estimated probabilities
##D stability.selection.heatmap(stab1)
## End(Not run)




