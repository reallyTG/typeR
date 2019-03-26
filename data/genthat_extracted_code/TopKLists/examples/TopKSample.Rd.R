library(TopKLists)


### Name: TopKSample
### Title: Sampler to generate N top-k lists according to p
### Aliases: TopKSample TopKSample.c

### ** Examples

set.seed(1234)
rank.pool <- 1:10
a <- sample(rank.pool, 10)
b <- sample(rank.pool, 10)
c <- sample(rank.pool, 10)
M <- cbind(a, b, c)

TopKSample.c(M, 4)




