library(cvmgof)


### Name: df.test.bootstrap
### Title: Global test for the conditional distribution function
### Aliases: df.test.bootstrap

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

# Test (bootstrap) under H0

# Remainder:
# Ducharme and Ferrigno test is on the conditional CDF and not on the link function
# Thus we need to define the conditional CDF associated
# with the link function under H0 to evaluate this test

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

# Test (bootstrap) under H0

test_df.H0 = df.test.bootstrap(data.X,data.Y,cond_cdf.H0,
  0.05,h.opt.df,bootstrap=c(50,'Mammen'),integration.step = 0.01)

########################################################################

# Test (bootstrap) under H1

# We want to test if the link function is f(x)=0.5*cos(x)+1
# The answer is no (see the definition of data.Y above)

linkfunction.H1=function(x){0.8*cos(x)+1}

data.X.H1 = data.X.H0
data.Y.H1 = linkfunction.H1(data.X.H1)+rnorm(n,mean=0,sd=0.3)
h.opt.df = df.bandwidth.selection.linkfunction(data.X.H1 , data.Y.H1,linkfunction.H1)

cond_cdf.H1=function(x,y)
{
  out=matrix(0,nrow=length(x),ncol=length(y))
  for (i in 1:length(x)){
    x0=x[i]
    out[i,]=pnorm(y-linkfunction.H1(x0),0,0.3)
  }
  out
}

test_df.H1 = df.test.bootstrap(data.X,data.Y,cond_cdf.H1,
  0.05,h.opt.df,bootstrap=c(50,'Mammen'),integration.step = 0.01)



