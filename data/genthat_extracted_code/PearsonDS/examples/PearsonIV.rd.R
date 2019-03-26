library(PearsonDS)


### Name: PearsonIV
### Title: The Pearson Type IV Distribution
### Aliases: PearsonIV dpearsonIV ppearsonIV qpearsonIV rpearsonIV
### Keywords: distribution

### ** Examples

## define Pearson type IV parameter set with m=5.1, nu=3, location=0.5, scale=2
pIVpars <- list(m=5.1, nu=3, location=0.5, scale=2)
## calculate probability density function
dpearsonIV(-2:2,params=pIVpars)
## calculate cumulative distribution function
ppearsonIV(-2:2,params=pIVpars)
## calculate quantile function
qpearsonIV(seq(0.1,0.9,by=0.2),params=pIVpars)
## generate random numbers
rpearsonIV(5,params=pIVpars)



