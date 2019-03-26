library(cvmgof)


### Name: vkgmss.residuals.cdf.estim
### Title: Kernel estimation of the error distribution
### Aliases: vkgmss.residuals.cdf.estim

### ** Examples


set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Estimation of residuals cdf

bandwidth = 0.75 # Here, the bandwidth is arbitrarily fixed

egrid = seq(-5,5,by=0.1)
res.cdf = vkgmss.residuals.cdf.estim(egrid,data.X,data.Y,0.5)

plot(egrid,res.cdf , type='l',xlab='e',ylab='CDF(e)')




