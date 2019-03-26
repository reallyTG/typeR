library(cvmgof)


### Name: df.linkfunction.estim
### Title: Local linear estimation of the regression function
### Aliases: df.linkfunction.estim

### ** Examples

set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Estimation of the link function

bandwidth = 0.75 # Here, the bandwidth is arbitrarily fixed

xgrid = seq(0,5,by=0.1)
ygrid_df = df.linkfunction.estim(xgrid,data.X,data.Y,bandwidth)

plot(xgrid,ygrid_df,type='l',lty=1,lwd=2,xlab='X',ylab='Y',ylim=c(0.25,2.5))
lines(xgrid,0.2*xgrid^2-xgrid+2,lwd=0.5,col='gray')




