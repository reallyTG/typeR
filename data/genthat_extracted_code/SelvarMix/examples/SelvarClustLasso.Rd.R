library(SelvarMix)


### Name: SelvarClustLasso
### Title: Regularization for variable selection in model-based clustering
### Aliases: SelvarClustLasso
### Keywords: model-based clustering, discriminant analysis, variable
###   selection, lasso ranking and graphical lasso

### ** Examples

## Not run: 
##D ## wine data set 
##D ## n = 178 observations, p = 27 variables 
##D data(wine)
##D set.seed(123)
##D obj <- SelvarClustLasso(x=wine[,1:27], nbcluster=1:5, nbcores=4)
##D summary(obj)
##D print(obj)
## End(Not run) 



