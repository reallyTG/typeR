library(cvmgof)


### Name: df.statistics
### Title: Global test statistic for the conditional distribution function
### Aliases: df.statistics

### ** Examples

set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Bandwidth selection under H0

# We want to test if the link function is f(x)=0.2*x^2-x+2
# The answer is yes (see the definition of data.Y above)
# We generate a dataset under H0 to estimate the optimal bandwidth under H0

linkfunction.H0 = function(x){0.2*x^2-x+2}

data.X.H0 = runif(n,min=0,max=5)
data.Y.H0 = linkfunction.H0(data.X.H0)+rnorm(n,mean=0,sd=0.3)

h.opt.df = df.bandwidth.selection.linkfunction(data.X.H0 , data.Y.H0,linkfunction.H0)

########################################################################

# Test statistics under H0

cond_cdf.H0 = function(x,y)
{
  out=matrix(0,nrow=length(x),ncol=length(y))
  for (i in 1:length(x)){
    x0=x[i]
    out[i,]=pnorm(y-linkfunction.H0(x0),0,0.3)
  }
  out
}
# cond_cdf.H0 is the conditional CDF associated with linkfunction.H0
# with additive Gaussian noise (standard deviation=0.3)

df.statistics(data.X,data.Y,cond_cdf.H0,h.opt.df)




