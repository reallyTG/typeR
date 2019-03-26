library(MFPCA)


### Name: UMPCA
### Title: UMPCA: Uncorrelated Multilinear Principle Component Analysis
### Aliases: UMPCA

### ** Examples

set.seed(12345)

 # define "true" components
 a <- sin(seq(-pi, pi, length.out = 100))
 b <- exp(seq(-0.5, 1, length.out = 150))
 
 # simulate tensor data
 X <- a %o% b %o% rnorm(80, sd = 0.5)
 
 # estimate one component
 UMPCAres <- UMPCA(X, numP = 1)
 
 # plot the results and compare to true values
 plot(UMPCAres$Us[[1]][,1])
 points(a/sqrt(sum(a^2)), pch = 20) # eigenvectors are defined only up to a sign change!
 legend("topright", legend = c("True", "Estimated"), pch = c(20, 1))
 
 plot(UMPCAres$Us[[2]][,1])
 points(b/sqrt(sum(b^2)), pch = 20)
 legend("topleft", legend = c("True", "Estimated"), pch = c(20, 1))



