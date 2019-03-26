library(PearsonDS)


### Name: PearsonI
### Title: The Pearson Type I (aka Beta) Distribution
### Aliases: PearsonI dpearsonI ppearsonI qpearsonI rpearsonI
### Keywords: distribution

### ** Examples

## define Pearson type I parameter set with a=2, b=3, location=1, scale=2
pIpars <- list(a=2, b=3, location=1, scale=2)
## calculate probability density function
dpearsonI(seq(1,3,by=0.5),params=pIpars)
## calculate cumulative distribution function
ppearsonI(seq(1,3,by=0.5),params=pIpars)
## calculate quantile function
qpearsonI(seq(0.1,0.9,by=0.2),params=pIpars)
## generate random numbers
rpearsonI(5,params=pIpars)



