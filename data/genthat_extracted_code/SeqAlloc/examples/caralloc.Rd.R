library(SeqAlloc)


### Name: caralloc
### Title: Sequential Allocation Using Covariate Adaptive Randomization
### Aliases: caralloc
### Keywords: Covariate-Adaptive Design Imbalance Tolerance

### ** Examples

sampsize <- 200
percent <- c(0.5,0.8,0.2,0.4)
carwt <- c(.4,.3,.2,.1)

set.seed(5798)

xmat <- matrix(rbinom(sampsize*length(percent),1,rep(percent,sampsize)),
              nrow=sampsize,ncol=length(percent),byrow=TRUE)
colnames(xmat) = c("C1","C2","C3","C4")
strat_factor = xmat[,1]*4 + xmat[,2]*2 + xmat[,4] + 1

caralloc(xmat,carwt,1,3)



