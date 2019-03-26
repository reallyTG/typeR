library(PearsonDS)


### Name: PearsonVII
### Title: The Pearson Type VII (aka Student's t) Distribution
### Aliases: PearsonVII dpearsonVII ppearsonVII qpearsonVII rpearsonVII
### Keywords: distribution

### ** Examples

## define Pearson type VII parameter set with df=7, location=1, scale=1
pVIIpars <- list(df=7, location=1, scale=1)
## calculate probability density function
dpearsonVII(-2:4,params=pVIIpars)
## calculate cumulative distribution function
ppearsonVII(-2:4,params=pVIIpars)
## calculate quantile function
qpearsonVII(seq(0.1,0.9,by=0.2),params=pVIIpars)
## generate random numbers
rpearsonVII(5,params=pVIIpars)



