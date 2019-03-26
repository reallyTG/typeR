library(SelvarMix)


### Name: SelvarMix-package
### Title: Regularization for variable selection in model-based clustering
###   and discriminant analysis
### Aliases: SelvarMix-package
### Keywords: package

### ** Examples

## Not run: 
##D ## wine data set 
##D ## n = 178 observations, p = 27 variables 
##D data(wine)
##D ## variable selection in model-based clustering  
##D set.seed(123)
##D obj <- SelvarClustLasso(x=wine[,1:27], nbcluster=1:5, nbcores=4)
##D summary(obj)
##D print(obj)
##D 
##D ## variables selection in discriminant analysis
##D set.seed(123)
##D a <- seq(1, 178, 10)
##D b <- setdiff(1:178, a)
##D obj <- SelvarLearnLasso(x=wine[b,1:27], z=wine[b,28], xt=wine[a,1:27], zt=wine[a,28], nbcores=4)
##D summary(obj)
##D print(obj)
## End(Not run)



