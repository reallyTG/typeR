library(PearsonDS)


### Name: PearsonV
### Title: The Pearson Type V (aka Inverse Gamma) Distribution
### Aliases: PearsonV dpearsonV ppearsonV qpearsonV rpearsonV
### Keywords: distribution

### ** Examples

## define Pearson type V parameter set with shape=3, location=1, scale=-2
pVpars <- list(shape=3, location=1, scale=-2)
## calculate probability density function
dpearsonV(-4:1,params=pVpars)
## calculate cumulative distribution function
ppearsonV(-4:1,params=pVpars)
## calculate quantile function
qpearsonV(seq(0.1,0.9,by=0.2),params=pVpars)
## generate random numbers
rpearsonV(5,params=pVpars)



