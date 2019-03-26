library(Rdimtools)


### Name: aux.kernelcov
### Title: Build a centered kernel matrix K
### Aliases: aux.kernelcov

### ** Examples

## Not run: 
##D ## generate data
##D X = aux.gensamples(n=100)
##D 
##D ## extra parameters do not matter for no-parameter kernels
##D A1 = aux.kernelcov(X,c("spline"))
##D A2 = aux.kernelcov(X,c("spline",1,2)) # these numbers will be disregarded.
##D print(paste("* aux.kernelcov : abs.diff.",norm(A1$K-A2$K,"f"),"in norm"))
## End(Not run)





