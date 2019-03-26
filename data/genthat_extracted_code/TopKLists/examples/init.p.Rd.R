library(TopKLists)


### Name: init.p
### Title: Initialization method for probabilities
### Aliases: init.p

### ** Examples

set.seed(1234)

rank.pool <- 1:10
a <- sample(rank.pool, 10)
b <- sample(rank.pool, 10)
c <- sample(rank.pool, 10)
rlist <- list(a, b, c)


init.p(rlist, length(unique(unlist(rlist))), 5, "cp")



