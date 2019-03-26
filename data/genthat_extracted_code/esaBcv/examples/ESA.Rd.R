library(esaBcv)


### Name: ESA
### Title: Estimate Latent Factor Matrix With Known Number of Factors
### Aliases: ESA

### ** Examples

Y <- matrix(rnorm(100), nrow = 10) + 3 * rnorm(10) %*% t(rep(1, 10))
ESA(Y, 1)



