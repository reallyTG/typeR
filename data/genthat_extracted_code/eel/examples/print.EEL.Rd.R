library(eel)


### Name: print.EEL
### Title: Printing EEL objects
### Aliases: print.EEL
### Keywords: printing EEL

### ** Examples

# EXAMPLE: computing the EEL for the mean of a bivariate random variable
# Generating a sample of n=40 bivariate observations. 
# For this example, we do this through a univariate normal random number generator.

uninorm<- rnorm(40*2,5,1)                          
multnorm<-matrix(uninorm,ncol=2)

# To calculate the EEL for a point theta=c(5,3), use
obj=EEL(x=multnorm,theta=c(5,3))

print(obj)



