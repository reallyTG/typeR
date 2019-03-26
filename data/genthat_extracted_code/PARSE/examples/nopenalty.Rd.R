library(PARSE)


### Name: nopenalty
### Title: Classical Model-based Clustering
### Aliases: nopenalty
### Keywords: external

### ** Examples

y <- rbind(matrix(rnorm(100,0,1),ncol=2), matrix(rnorm(100,4,1), ncol=2))
output <- nopenalty(K = c(1:2), y)
output$mu.hat.best




