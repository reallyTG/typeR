library(RNGforGPD)


### Name: CmatStarGpois
### Title: Computes Intermediate Correlation Matrix
### Aliases: CmatStarGpois

### ** Examples

## No test: 
 lambda.vec = c(-0.2, 0.2, -0.3)
 theta.vec = c(1, 3, 4)
 M = c(0.352, 0.265, 0.342)
 N = diag(3)
 N[lower.tri(N)] = M
 TV = N + t(N)
 diag(TV) = 1
 cstar = CmatStarGpois(TV, theta.vec, lambda.vec)
 cstar
## End(No test)



