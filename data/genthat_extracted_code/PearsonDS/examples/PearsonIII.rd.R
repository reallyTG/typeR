library(PearsonDS)


### Name: PearsonIII
### Title: The Pearson Type III (aka Gamma) Distribution
### Aliases: PearsonIII dpearsonIII ppearsonIII qpearsonIII rpearsonIII
### Keywords: distribution

### ** Examples

## define Pearson type III parameter set with shape=3, location=1, scale=-2
pIIIpars <- list(shape=3, location=1, scale=-0.5)
## calculate probability density function
dpearsonIII(-4:1,params=pIIIpars)
## calculate cumulative distribution function
ppearsonIII(-4:1,params=pIIIpars)
## calculate quantile function
qpearsonIII(seq(0.1,0.9,by=0.2),params=pIIIpars)
## generate random numbers
rpearsonIII(5,params=pIIIpars)



