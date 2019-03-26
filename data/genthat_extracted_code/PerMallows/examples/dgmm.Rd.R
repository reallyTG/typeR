library(PerMallows)


### Name: dgmm
### Title: Calculate the probability of a permutation in a GMM
### Aliases: dgmm

### ** Examples

data <- matrix(c(1,2,3,4, 1,4,3,2, 1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
sig <- c(1,2,3,4)
th <- c(0.1, 0.2, 0.3,1)
log.prob <- apply(data,MARGIN=1,FUN=function(x){log(dgmm(x,sig, th, "hamming"))})
sum(log.prob)
dgmm (c(1,2,3,4), theta=c(1,1,1))
dgmm (c(1,2,3,4), theta=c(1,1,1), dist.name="cayley")



