library(SeqAlloc)


### Name: SeqAllocplot
### Title: Plot the evaluation criteria for the designs
### Aliases: SeqAllocplot

### ** Examples

sampsize <- 200
percent <- c(0.5,0.8,0.2,0.4)
set.seed(200)

xmat <- matrix(rbinom(sampsize*length(percent),1,rep(percent,sampsize)),
              nrow=sampsize,ncol=length(percent),byrow=TRUE)
colnames(xmat) <- c("C1","C2","C3","C4")
strat_factor <- xmat[,1]*4 + xmat[,2]*2 + xmat[,4] + 1

mysim <- SeqAlloc(xmat,carwt=c(.4,.3,.2,.1),strata=strat_factor,blksize=c(2,6),
                   pbcd=.7,pcar=.67,bsdtol=2,caittol=3,niter=10, seed = 30924)

SeqAllocplot(mysim,bporder = c(3,4,7,8), stratum = FALSE, cexsize=0.6)



