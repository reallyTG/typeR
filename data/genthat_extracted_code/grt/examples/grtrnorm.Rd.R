library(grt)


### Name: grtrnorm
### Title: Sample from multiple multivariate normal distributions
### Aliases: grtrnorm
### Keywords: datagen

### ** Examples

m <- list(c(268,157), c(332, 93))
covs <- matrix(c(4538, 4351, 4351, 4538), ncol=2)
II <- grtrnorm(n=80, np=2, means=m, covs=covs)


m <- list(c(283,98),c(317,98),c(283,152),c(317,152))
covs <- diag(75, ncol=2, nrow=2)
CJ <- grtrnorm(n=c(8,16,16,40), np=4, means=m, covs=covs)
CJ$category <- c(1,1,1,2)[CJ$category]



