library(smfsb)


### Name: mcmcSummary
### Title: Summarise and plot tabular MCMC output
### Aliases: mcmcSummary
### Keywords: smfsb

### ** Examples

out=normgibbs(N=1000,n=15,a=3,b=11,cc=10,d=1/100,xbar=25,ssquared=20)
names(out)=c("mu","tau")
mcmcSummary(out,rows=2,bins=10,truth=c(25,1/20))



