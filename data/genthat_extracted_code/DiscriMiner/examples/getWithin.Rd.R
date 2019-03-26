library(DiscriMiner)


### Name: getWithin
### Title: Within-class Covariance Matrix
### Aliases: getWithin

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # estimated within-class covariance matrix (dividing by n-k)
##D   getWithin(iris[,1:4], iris[,5])
##D 
##D   # compared to the within-class covariance matrix (dividing by n-1)
##D   withinCov(iris[,1:4], iris[,5])
##D   
## End(Not run)



