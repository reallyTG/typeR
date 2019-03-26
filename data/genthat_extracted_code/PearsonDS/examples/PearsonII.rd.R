library(PearsonDS)


### Name: PearsonII
### Title: The Pearson Type II (aka Symmetric Beta) Distribution
### Aliases: PearsonII dpearsonII ppearsonII qpearsonII rpearsonII
### Keywords: distribution

### ** Examples

## define Pearson type II parameter set with a=2, location=1, scale=2
pIIpars <- list(a=2, location=1, scale=2)
## calculate probability density function
dpearsonII(seq(1,3,by=0.5),params=pIIpars)
## calculate cumulative distribution function
ppearsonII(seq(1,3,by=0.5),params=pIIpars)
## calculate quantile function
qpearsonII(seq(0.1,0.9,by=0.2),params=pIIpars)
## generate random numbers
rpearsonII(5,params=pIIpars)



