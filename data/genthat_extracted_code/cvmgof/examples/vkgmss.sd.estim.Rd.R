library(cvmgof)


### Name: vkgmss.sd.estim
### Title: Kernel estimation of the standard deviation function
### Aliases: vkgmss.sd.estim

### ** Examples


set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Estimation of residuals standard deviation

bandwidth = 0.75 # Here, the bandwidth is arbitrarily fixed

xgrid = seq(0,5,by=0.1)
sd = vkgmss.sd.estim(xgrid,data.X,data.Y,bandwidth)

plot(xgrid,sd , type='l',xlab='X',ylab='SD(X)')
abline(h=0.3)




