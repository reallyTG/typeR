library(mistral)


### Name: ComputeDistributionParameter
### Title: Compute internal parameters and moments for univariate
###   distribution functions
### Aliases: ComputeDistributionParameter

### ** Examples
 
distX1 <- list(type='Lnorm', MEAN=120.0, STD=12.0, P1=NULL, P2=NULL, NAME='X1')
distX1 <- ComputeDistributionParameter(distX1)
print(distX1)



