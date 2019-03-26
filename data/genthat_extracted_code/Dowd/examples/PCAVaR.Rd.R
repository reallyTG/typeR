library(Dowd)


### Name: PCAVaR
### Title: Estimates VaR by principal components analysis
### Aliases: PCAVaR

### ** Examples

# Computes PCA VaR
   Ra <- matrix(rnorm(4*6),4,6)
   position.data <- rnorm(6)
   PCAVaR(Ra, position.data, 2, .95)



