library(Rborist)


### Name: PreTrain
### Title: Preformatting for Training with Warm Starts
### Aliases: PreTrain PreTrain.default

### ** Examples

  ## Not run: 
##D     data(iris)
##D     pt <- PreTrain(iris[,-5])
##D 
##D     ppTry <- seq(0.2, 0.5, by= 0.3/10)
##D     nIter <- length(ppTry)
##D     rsq <- numeric(nIter)
##D     for (i in 1:nIter) {
##D       rb <- Rborist(pt, iris[,5], predProb=ppTry[i])
##D       rsq[i] = rb$validiation$rsq
##D     }
##D   
## End(Not run)



