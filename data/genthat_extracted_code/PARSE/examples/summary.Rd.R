library(PARSE)


### Name: summary
### Title: summary of the clustering results
### Aliases: summary summary.parse_fit

### ** Examples

y <- rbind(matrix(rnorm(120,0,1),ncol=4),
matrix(rnorm(120,4,1), ncol=4), matrix(rnorm(120,0,1),ncol=4))
output <- parse(K = c(1:2), lambda = c(0,1), y=y)
output$mu.hat.best
summary(output, y)




