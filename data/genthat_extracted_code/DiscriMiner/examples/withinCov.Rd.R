library(DiscriMiner)


### Name: withinCov
### Title: Within-class Covariance Matrix
### Aliases: withinCov

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # within-class covariance matrix (dividing by n-1)
##D   withinCov(iris[,1:4], iris[,5])
##D 
##D   # within-class covariance matrix (dividing by n)
##D   withinCov(iris[,1:4], iris[,5], div_by_n=TRUE)
##D   
## End(Not run)



