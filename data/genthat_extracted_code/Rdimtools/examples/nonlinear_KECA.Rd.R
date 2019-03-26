library(Rdimtools)


### Name: do.keca
### Title: Kernel Entropy Component Analysis
### Aliases: do.keca

### ** Examples

## Not run: 
##D ## generate ribbon-shaped data
##D ## in order to pass CRAN pretest, n is set to be small.
##D X = aux.gensamples(dname="ribbon",n=100)
##D 
##D ## 1. standard KECA with gaussian kernel
##D output1 <- do.keca(X,ndim=2)
##D 
##D ## 2. gaussian kernel with large bandwidth
##D output2 <- do.keca(X,ndim=2,kernel=c("gaussian",5))
##D 
##D ## 3. use laplacian kernel
##D output3 <- do.keca(X,ndim=2,kernel=c("laplacian",1))
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="Gaussian kernel")
##D plot(output2$Y[,1],output2$Y[,2],main="Gaussian, sigma=5")
##D plot(output3$Y[,1],output3$Y[,2],main="Laplacian kernel")
## End(Not run)




