library(PARSE)


### Name: parse
### Title: Model-based Clustering with PARSE
### Aliases: parse
### Keywords: external

### ** Examples

y <- rbind(matrix(rnorm(120,0,1),ncol=3), matrix(rnorm(120,4,1), ncol=3))
output <- parse(K = c(1:2), lambda = c(0,1), y=y, cores=2)
output$mu.hat.best



