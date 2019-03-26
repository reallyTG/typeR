library(SeqAlloc)


### Name: SeqAlloc
### Title: Sequential Allocation for Prospective Experiments
### Aliases: SeqAlloc
### Keywords: Designed Experiment

### ** Examples

sampsize <- 200
percent <- c(0.5,0.8,0.2,0.4)
set.seed(200)

xmat <- matrix(rbinom(sampsize*length(percent),1,rep(percent,sampsize)),
              nrow=sampsize,ncol=length(percent),byrow=TRUE)
colnames(xmat) <- c("C1","C2","C3","C4")
strat_factor <- xmat[,2]*2 + xmat[,4] + 1

SeqAlloc(xmat,carwt=c(.4,.3,.2,.1),strata=strat_factor,blksize=c(2,6),
         pbcd=.7,pcar=.8,bsdtol=2,caittol=5,niter=10, seed = 20850)




