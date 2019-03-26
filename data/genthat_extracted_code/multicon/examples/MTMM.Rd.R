library(multicon)


### Name: MTMM
### Title: Multi Trait Multi Method Matrix
### Aliases: MTMM
### Keywords: multi trait multi method matrix

### ** Examples

	# We can generate some random data by first creating a population correlation matrix
sig <- matrix(c(1.00,.4,.6,.05,.1,-.05,.4,1.00,.5,.08,
	-.02,.03,.6,.5,1.00,.09,.1,-.07,.05,.08,.09,1.00,.6,.7,.1,-.02,.1,.6,
	1.00,.5,-.05,.03,-.07,.7,.5,1.00), ncol=6, byrow=TRUE)
sig
library(mvtnorm)
	# Now create random data based on this population matrix
d <- rmvnorm(100, sigma=sig)
	#Now use MTMM on this data.frame indicating that there are 2 traits and 3 methods. 
MTMM(d, 2, 3)



