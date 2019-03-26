library(Rnets)


### Name: Estimate_pCorrs
### Title: Estimation of partial correlation matrix from precision matrix
### Aliases: Estimate_pCorrs

### ** Examples

data('mtcars')
Sigma <- cor(mtcars[,c(1, 3:7)])
Theta <- Sigma^-1
Omega <- Estimate_pCorrs(Theta)



