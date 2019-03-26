library(bootcluster)


### Name: stability
### Title: Estimate clustering stability of k-means
### Aliases: stability

### ** Examples

set.seed(1)
data(wine)
x0 <- wine[,2:14]
x <- scale(x0)
stability(x, k = 3, B=20, r=5, scheme_2 = TRUE)



