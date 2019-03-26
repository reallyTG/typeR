library(cfa)


### Name: PXisMclassic
### Title: Test according to Lindner
### Aliases: PXisMclassic
### Keywords: multivariate htest

### ** Examples

# Does not work with windows since there is no parallel for it
if (require (parallel)) {

lk<-4 # number of parameters
ln<-c(59,57,59,58) # marginal sums of the parameters realized in the configuration to be tested
lNt<-116 # sample size of configurations
lm0<-16 # observed frequency of the configuration tested


# Old algorithm
starttime=proc.time()
pHXsmallerequalM0<-sum(unlist(mclapply(0:lm0,PXisMclassic,ln,lNt,lk)))
pHXequalM0<-PXisMclassic(lm0,ln,lNt,lk)
pHlargerequalM0<-sum(unlist(mclapply(lm0: min(ln),PXisMclassic,ln,lNt,lk)))
stoptime<-proc.time()
list(pHXsmallerequalM0=pHXsmallerequalM0,pHXequalM0=pHXequalM0,pHlargerequalM0=pHlargerequalM0,
timed.required=stoptime-starttime)
# End of the old algorithm
}




