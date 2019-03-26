library(SimCorMultRes)


### Name: rsmvnorm
### Title: Simulating Continuous Random Vectors from a Multivariate Normal
###   Distribution
### Aliases: rsmvnorm

### ** Examples

## Simulating 10000 bivariate random vectors with correlation parameter
## equal to 0.4.
set.seed(1)
R <- 10000
cor.matrix <- toeplitz(c(1, 0.4))
SimBivariateNormal <- rsmvnorm(R = R, cor.matrix = cor.matrix)
colMeans(SimBivariateNormal)
apply(SimBivariateNormal, 2, sd)
cor(SimBivariateNormal)



