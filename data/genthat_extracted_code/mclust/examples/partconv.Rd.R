library(mclust)


### Name: partconv
### Title: Numeric Encoding of a Partitioning
### Aliases: partconv
### Keywords: cluster

### ** Examples

partconv(iris[,5])

set.seed(0)
cl <- sample(LETTERS[1:9], 25, replace=TRUE)
partconv(cl, consec=FALSE)
partconv(cl, consec=TRUE)



