library(PearsonDS)


### Name: PearsonVI
### Title: The Pearson Type VI (aka Beta Prime) Distribution
### Aliases: PearsonVI dpearsonVI ppearsonVI qpearsonVI rpearsonVI
### Keywords: distribution

### ** Examples

## define Pearson type VI parameter set with a=2, b=3, location=1, scale=2
pVIpars <- list(a=2, b=3, location=1, scale=2)
## calculate probability density function
dpearsonVI(seq(1,6,by=1),params=pVIpars)
## calculate cumulative distribution function
ppearsonVI(seq(1,6,by=1),params=pVIpars)
## calculate quantile function
qpearsonVI(seq(0.1,0.9,by=0.2),params=pVIpars)
## generate random numbers
rpearsonVI(5,params=pVIpars)



