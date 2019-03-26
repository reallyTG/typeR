library(PARSE)


### Name: heatmap_fit
### Title: summary plot of globally and pairwise informative variables
### Aliases: heatmap_fit
### Keywords: external

### ** Examples

y <- rbind(matrix(rnorm(120,0,1),ncol=4),
matrix(rnorm(120,4,1), ncol=4), matrix(rnorm(120,0,1),ncol=4))
output <- parse(K = 3, lambda = 1, y=y)
output$mu.hat.best
heatmap_fit(output, y, cexRow=1)




