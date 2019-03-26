library(PARSE)


### Name: apL1
### Title: Model-based Clustering with APL1
### Aliases: apL1
### Keywords: external

### ** Examples

y <- rbind(matrix(rnorm(100,0,1),ncol=2), matrix(rnorm(100,4,1), ncol=2))
output <- apL1(K = c(1:2), lambda = c(0,0.1), y=y)
output$mu.hat.best




