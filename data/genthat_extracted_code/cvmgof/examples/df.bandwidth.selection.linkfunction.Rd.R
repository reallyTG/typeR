library(cvmgof)


### Name: df.bandwidth.selection.linkfunction
### Title: Bandwidth selection of the link function under the null
###   hypothesis
### Aliases: df.bandwidth.selection.linkfunction

### ** Examples

set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Bandwidth selection under H0

# We generate a dataset under H0 to estimate the optimal bandwidth under H0

linkfunction.H0 = function(x){0.2*x^2-x+2}

data.X.H0 = runif(n,min=0,max=5)
data.Y.H0 = linkfunction.H0(data.X.H0)+rnorm(n,mean=0,sd=0.3)

h.opt.df = df.bandwidth.selection.linkfunction(data.X.H0 , data.Y.H0,linkfunction.H0)




