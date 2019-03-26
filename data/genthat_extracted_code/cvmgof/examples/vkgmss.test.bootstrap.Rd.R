library(cvmgof)


### Name: vkgmss.test.bootstrap
### Title: Local test for the regression function
### Aliases: vkgmss.test.bootstrap

### ** Examples

set.seed(1)

# Data simulation
n = 25 # Dataset size
data.X = runif(n,min=0,max=5) # X
data.Y = 0.2*data.X^2-data.X+2+rnorm(n,mean=0,sd=0.3) # Y

########################################################################

# Test (bootstrap) under H0

# We want to test if the link function is f(x)=0.2*x^2-x+2
# The answer is yes (see the definition of data.Y above)
# We generate a dataset under H0 to estimate the optimal bandwidth under H0

linkfunction.H0 = function(x){0.2*x^2-x+2}

test_vkgmss.H0 = vkgmss.test.bootstrap(data.X,data.Y,linkfunction.H0,
	0.05,bandwidth='optimal',bootstrap=c(50,'Mammen'))


########################################################################

# Test (bootstrap) under H1

# We want to test if the link function is f(x)=0.5*cos(x)+1
# The answer is no (see the definition of data.Y above)

linkfunction.H1=function(x){0.8*cos(x)+1}

test_vkgmss.H1 = vkgmss.test.bootstrap(data.X,data.Y,linkfunction.H1,
	 0.05,bandwidth='optimal',bootstrap=c(50,'Mammen'))




