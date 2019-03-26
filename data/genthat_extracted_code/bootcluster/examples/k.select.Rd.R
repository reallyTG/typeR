library(bootcluster)


### Name: k.select
### Title: Estimate number of clusters
### Aliases: k.select

### ** Examples

set.seed(1)
data(wine)
x0 <- wine[,2:14]
x <- scale(x0)
k.select(x, range = 2:10, B=20, r=5, scheme_2 = TRUE)



