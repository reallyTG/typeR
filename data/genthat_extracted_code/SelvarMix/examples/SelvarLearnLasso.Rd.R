library(SelvarMix)


### Name: SelvarLearnLasso
### Title: Regularization for variable selection in discriminant analysis
### Aliases: SelvarLearnLasso
### Keywords: discriminant analysis, variable selection, lasso ranking and
###   graphical lasso

### ** Examples

## Not run: 
##D ## wine data set 
##D ## n = 178 observations, p = 27 variables 
##D data(wine)
##D set.seed(123)
##D a <- seq(1, 178, 10)
##D b <- setdiff(1:178, a)
##D obj <- SelvarLearnLasso(x=wine[b,1:27], z=wine[b,28], xt=wine[a,1:27], zt=wine[a,28], nbcores=4)
##D summary(obj)
##D print(obj)
## End(Not run)



