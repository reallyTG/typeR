library(cvmgof)


### Name: df.cdf.estim
### Title: Local linear estimation of the conditional distribution function
### Aliases: df.cdf.estim

### ** Examples

set.seed(1)

require(lattice) # Only for plotting conditional CDF

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Estimation of the link function

bandwidth = 0.75 # Here, the bandwidth is arbitrarily fixed

# Estimation of the conditional CDF
xgrid = seq(0.5,4.5,by=0.1)
ygrid = seq(-1,3,by=0.1)
cdf_df = df.cdf.estim(xgrid,ygrid,data.X,data.Y,bandwidth)

wireframe(cdf_df, drape=TRUE,
	col.regions=rainbow(100),zlab='CDF(y|x)',xlab='x',ylab='y',zlim=c(0,1.01))




