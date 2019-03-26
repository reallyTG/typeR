library(cba)


### Name: gknn
### Title: Generalized k-Nearest Neighbor Classification
### Aliases: gknn
### Keywords: cluster classif

### ** Examples

## Not run: 
##D ### extend Rock example
##D data(Votes)
##D x <- as.dummy(Votes[-17])
##D rc <- rockAll(x, n=2, m=100, theta=0.73, predict=FALSE, debug=TRUE)
##D gc <- gknn(dist(x, rc$y, method="binary"), rc$cl, k=3)
##D table(gc[rc$s], rc$cl)
## End(Not run)



