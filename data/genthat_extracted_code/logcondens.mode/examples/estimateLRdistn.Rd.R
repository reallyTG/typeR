library(logcondens.mode)


### Name: estimateLRdistn
### Title: Estimate "the" limiting distribution of the likelihood ratio
###   statistic for location of mode.
### Aliases: estimateLRdistn
### Keywords: nonparametric

### ** Examples


myseed <- 561

{if(require(distr)){
  mydistn <- Norm() ##demonstrate use of distr package
  myr <- mydistn@r
}
else {
  myr <- rnorm
}}

hypothesis.mode <- 0
N.MC <- 100 ## should increase these values for better estimate
n.SS <- 50

LRres <- estimateLRdistn(rdist=myr, mode=hypothesis.mode, N.MC=N.MC, prec=10^-10,
               n.SS=n.SS, seedVal=myseed,
               debugging=FALSE)
TLLRs <- sort(LRres$TLLRs) ##sort is unnecessary, just for examining data
negIdcs <- TLLRs<=0; ## rounding errors 
Nneg <- sum(negIdcs)
print(Nneg)
TLLRs[negIdcs] <- 0

cdf.empirical.f <- ecdf(TLLRs)
xlims <- c(min(TLLRs), max(TLLRs))
xpts <- seq(from=xlims[1], to=xlims[2], by=.001)
plot(xpts, cdf.empirical.f(xpts), type="l",
     xlab="TLLRs", ylab="Probability")


#### LCTLLRdistn used 1e4 Monte Carlos with 1.2e3 samples each Monte
####Carlo.
##lines(xpts, LCTLLRdistn@p(xpts), col="blue") ## "object
##'C_R_approxfun' not found" error on winbuilder





