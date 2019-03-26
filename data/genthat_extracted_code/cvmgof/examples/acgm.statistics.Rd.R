library(cvmgof)


### Name: acgm.statistics
### Title: Local test statistic for the regression function
### Aliases: acgm.statistics

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

h.opt.acgm = acgm.bandwidth.selection.linkfunction(data.X.H0 , data.Y.H0,linkfunction.H0)

########################################################################

# Test statistics under H0

acgm.statistics(data.X,data.Y,linkfunction.H0,h.opt.acgm)




