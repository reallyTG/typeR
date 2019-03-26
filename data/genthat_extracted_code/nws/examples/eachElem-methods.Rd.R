library(nws)


### Name: eachElem
### Title: Apply a Function in Parallel over a Set of Lists and Vectors
### Aliases: eachElem-methods eachElem,sleigh-method eachElem
### Keywords: methods

### ** Examples

  ## Not run: 
##D # create a sleigh
##D s <- sleigh()
##D 
##D # compute the list mean for each list element
##D x <- list(a=1:10, beta=exp(-3:3), logic=c(TRUE,FALSE,FALSE,TRUE))
##D eachElem(s, mean, list(x))
##D 
##D # median and quartiles for each list element
##D eachElem(s, quantile, elementArgs=list(x), fixedArgs=list(probs=1:3/4))
##D 
##D # use eo$elementFunc to supply 100 random values and eo$accumulator to
##D # receive the results
##D elementFunc <- function(i, by) {
##D   if (i <= 100) list(i=i, x=runif(1)) else stop()
##D }
##D accumulator <- function(resultList, taskVector) {
##D   if (resultList[[1]][[1]] != taskVector[1]) stop('assertion failure')
##D   cat(paste(resultList[[1]], collapse=' '), '\n')
##D }
##D eo <- list(elementFunc=elementFunc, accumulator=accumulator)
##D eachElem(s, function(i, x) list(i=i, x=x, xsq=x*x), eo=eo)
##D   
## End(Not run)



