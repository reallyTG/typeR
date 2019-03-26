library(ppgmmga)


### Name: plot.ppgmmga
### Title: Plots the data onto the projection subspace estimated by the
###   ppgmmga algorithm
### Aliases: plot.ppgmmga
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D data(iris)
##D X <- iris[,-5]
##D Class <- iris$Species
##D 
##D # 1D
##D pp1 <- ppgmmga(data = X, d = 1, approx = "UT")
##D summary(pp1, check = TRUE)
##D plot(pp1)
##D plot(pp1, Class)
##D 
##D # 2D
##D pp2 <- ppgmmga(data = X, d = 2, approx = "UT")
##D summary(pp2, check = TRUE)
##D plot(pp2)
##D plot(pp2, Class)
##D 
##D # 3D
##D pp3 <- ppgmmga(data = X, d = 3)
##D summary(pp3, check = TRUE)
##D plot(pp3)
##D plot(pp3, Class)
##D plot(pp3, Class, dim = c(1,3))
##D plot(pp3, Class, dim = c(2,3))
## End(Not run)



