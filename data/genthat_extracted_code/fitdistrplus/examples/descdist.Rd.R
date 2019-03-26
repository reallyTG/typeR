library(fitdistrplus)


### Name: descdist
### Title: Description of an empirical distribution for non-censored data
### Aliases: descdist print.descdist
### Keywords: distribution

### ** Examples

# (1) Description of a sample from a normal distribution
# with and without uncertainty on skewness and kurtosis estimated by bootstrap 
#
set.seed(1234)
x1 <- rnorm(100)
descdist(x1)
descdist(x1,boot=500)

# (2) Description of a sample from a beta distribution
# with uncertainty on skewness and kurtosis estimated by bootstrap
# with changing of default colors and plotting character for observed point
#
descdist(rbeta(100,shape1=0.05,shape2=1),boot=500,
obs.col="blue", obs.pch = 15, boot.col="yellow")

# (3) Description of a sample from a gamma distribution
# with uncertainty on skewness and kurtosis estimated by bootstrap
# without plotting 
#
descdist(rgamma(100,shape=2,rate=1),boot=500,graph=FALSE)

# (3) Description of a sample from a Poisson distribution
# with uncertainty on skewness and kurtosis estimated by bootstrap 
#
descdist(rpois(100,lambda=2),discrete=TRUE,boot=500)

# (4) Description of serving size data
# with uncertainty on skewness and kurtosis estimated by bootstrap 
#
data(groundbeef)
serving <- groundbeef$serving
descdist(serving, boot=500)



