library(FDGcopulas)


### Name: corFDG
### Title: Sample pairwise dependence coefficients
### Aliases: corFDG

### ** Examples

## Generate an extreme-value copula
myFDGcopula <- FDGcopula("frechet", c(.3,.5,.7,.9), extremevalue=TRUE)
dat <- rFDG(100, myFDGcopula)
## Compute the sample upper tail dependence coefficient given in the reference
corFDG(dat, "utdc")



