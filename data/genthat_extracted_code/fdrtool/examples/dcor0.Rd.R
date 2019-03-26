library(fdrtool)


### Name: dcor0
### Title: Distribution of the Vanishing Correlation Coefficient (rho=0)
###   and Related Functions
### Aliases: dcor0 pcor0 rcor0 qcor0
### Keywords: distribution

### ** Examples

# load fdrtool library
library("fdrtool")

# distribution of r for various degrees of freedom
x = seq(-1,1,0.01)
y1 = dcor0(x, kappa=7)
y2 = dcor0(x, kappa=15)
plot(x,y2,type="l", xlab="r", ylab="pdf",
  xlim=c(-1,1), ylim=c(0,2))
lines(x,y1)

# simulated data
r = rcor0(1000, kappa=7)
hist(r, freq=FALSE, 
  xlim=c(-1,1), ylim=c(0,5))
lines(x,y1,type="l")

# distribution function
pcor0(-0.2, kappa=15)



