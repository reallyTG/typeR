library(PerMallows)


### Name: dmm
### Title: Calculate the probability of a permutation in a MM
### Aliases: dmm

### ** Examples

data <- matrix(c(1,2,3, 4,1,4,3,2,1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
sig<-c(1,2,3,4)
log.prob <- apply(data,MARGIN=1,FUN=function(x){log(dmm(x,sig, 1,"cayley"))})
sum(log.prob)
dmm(c(1,3,2,4), theta=0.1)
dmm(c(1,3,2,4), theta=0.1, dist.name="cayley")
dmm(c(1,3,2,4), theta=0.1, dist.name="hamming")
dmm(c(1,3,2,4), theta=0.1, dist.name="ulam")



