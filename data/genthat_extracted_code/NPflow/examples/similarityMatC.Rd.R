library(NPflow)


### Name: similarityMatC
### Title: C++ implementation
### Aliases: similarityMatC

### ** Examples

c <- list(c(1,1,2,3,2,3), c(1,1,1,2,3,3),c(2,2,1,1,1,1))
similarityMatC(sapply(c, "["))

c2 <- list()
for(i in 1:10){
    c2 <- c(c2, list(rmultinom(n=1, size=200, prob=rexp(n=200))))
}
similarityMatC(sapply(c2, "["))




