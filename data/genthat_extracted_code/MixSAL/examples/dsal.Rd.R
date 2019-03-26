library(MixSAL)


### Name: dsal
### Title: Probability Density Function for a Multivariate SAL Distribution
### Aliases: dsal
### Keywords: Probability Density Function Multivariate SAL Distribution

### ** Examples

## For this illustration, consider bivariate SAL data from the specified distribution:
x <- rsal(n=10,p=2,alpha=c(2,2),sig=diag(2),mu=c(0,0))
## The value of the probability density function for each of the simulated values are given by:
dsal(x=x,alpha=c(2,2),sig=diag(2),mu=c(0,0))



