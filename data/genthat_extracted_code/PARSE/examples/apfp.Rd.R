library(PARSE)


### Name: apfp
### Title: Model-based Clustering with APFP
### Aliases: apfp
### Keywords: external

### ** Examples

y <- rbind(matrix(rnorm(100,0,1),ncol=2), matrix(rnorm(100,4,1), ncol=2))
output <- apfp(K = c(1:2), lambda = c(0,1), y=y)
output$mu.hat.best




