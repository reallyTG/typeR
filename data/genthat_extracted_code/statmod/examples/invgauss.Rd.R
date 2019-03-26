library(statmod)


### Name: invgauss
### Title: Inverse Gaussian Distribution
### Aliases: InverseGaussian dinvgauss pinvgauss qinvgauss rinvgauss
### Keywords: distribution

### ** Examples

q <- rinvgauss(10, mean=1, disp=0.5) # generate vector of 10 random numbers
p <- pinvgauss(q, mean=1, disp=0.5) # p should be uniformly distributed

# Quantile for small right tail probability:
qinvgauss(1e-20, mean=1.5, disp=0.7, lower.tail=FALSE)

# Same quantile, but represented in terms of left tail probability on log-scale
qinvgauss(-1e-20, mean=1.5, disp=0.7, lower.tail=TRUE, log.p=TRUE)



