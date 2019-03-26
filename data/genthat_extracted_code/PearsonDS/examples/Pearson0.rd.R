library(PearsonDS)


### Name: Pearson0
### Title: The Pearson Type 0 (aka Normal) Distribution
### Aliases: Pearson0 dpearson0 ppearson0 qpearson0 rpearson0
### Keywords: distribution

### ** Examples

## define Pearson type 0 parameter set with mean=-1, sd=2
p0pars <- list(mean=-1, sd=2)
## calculate probability density function
dpearson0(-4:1,params=p0pars)
## calculate cumulative distribution function
ppearson0(-4:1,params=p0pars)
## calculate quantile function
qpearson0(seq(0.1,0.9,by=0.2),params=p0pars)
## generate random numbers
rpearson0(5,params=p0pars)



