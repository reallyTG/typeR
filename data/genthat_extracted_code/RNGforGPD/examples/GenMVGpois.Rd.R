library(RNGforGPD)


### Name: GenMVGpois
### Title: Generates Data from Multivariate Generalized Poisson
###   Distribution
### Aliases: GenMVGpois

### ** Examples

## No test: 
 sample.size = 10000; no.gpois = 3
 lambda.vec = c(0.2, 0.2, 0.3); theta.vec = c(1, 3, 4)
 M = c(0.352, 0.265, 0.342); N = diag(3); N[lower.tri(N)] = M
 TV = N + t(N); diag(TV) = 1
 cstar = CmatStarGpois(TV, theta.vec, lambda.vec)
 data = GenMVGpois(sample.size, no.gpois, cstar, theta.vec, lambda.vec, details = FALSE)
 apply(data, 2, mean) # empirical means
 theta.vec / (1 - lambda.vec) # theoretical means
 apply(data, 2, var) # empirical variances
 theta.vec / (1 - lambda.vec)^3 # theoretical variances
 cor(data) # empirical correlation matrix
 TV # specified correlation matrix
## End(No test)



