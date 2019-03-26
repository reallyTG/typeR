library(GPrank)


### Name: get_bbgpMeanStd
### Title: Computing means and standard deviations for the BBGP (beta
###   binomial Gaussian process) model
### Aliases: get_bbgpMeanStd
### Keywords: bbgp

### ** Examples

x=c(1,2,3,4,5)
counts=c(12,54,32,0,34)
seq_depth=c(50,70,35,0,40)
bbgp=get_bbgpMeanStd(x,counts,seq_depth)
x=bbgp$time # updated time vector
y=bbgp$posteriorMean # posterior means
v=bbgp$posteriorStd^2 # posterior variances




