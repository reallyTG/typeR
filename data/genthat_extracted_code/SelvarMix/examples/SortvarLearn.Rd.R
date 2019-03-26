library(SelvarMix)


### Name: SortvarLearn
### Title: Variable ranking with LASSO in discriminant analysis
### Aliases: SortvarLearn
### Keywords: Variable ranking Penalized discriminant analysis

### ** Examples

## Not run: 
##D ## wine data set 
##D ## n = 178 observations, p = 27 variables 
##D require(Rmixmod)
##D require(glasso)
##D data(wine)
##D set.seed(123)
##D obj <- SortvarLearn(x=wine[,1:27], z=wine[,28], nbcores=4)
## End(Not run)



