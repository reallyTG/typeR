library(spTimer)


### Name: spT.pCOVER
### Title: Nominal Coverage
### Aliases: spT.pCOVER
### Keywords: utility

### ** Examples

##

# Create `x': the true values.
# Create `yup': the upper interval.
# Create `ylow': the lower interval.

x <- rnorm(1000,5,0.1)
yup <- rnorm(1000,7,2)
ylow <- rnorm(1000,3,2)
	
# The pCOVER is:

spT.pCOVER(z=x, zup=yup, zlow=ylow)

# create predicted MCMC samples

y <- matrix(rnorm(1000*5000,5,1),1000,5000)

# The pCOVER is:

spT.pCOVER(z=x, zsample=y)
spT.pCOVER(z=x, zsample=y, level=50)

##  



