library(MBESS)


### Name: CFA.1
### Title: One-factor confirmatory factor analysis model
### Aliases: CFA.1
### Keywords: multivariate

### ** Examples

## Not run: 
##D cov.mat<- matrix(
##D c(1.384, 1.484, 1.988, 2.429, 3.031,
##D 1.484, 2.756, 2.874, 3.588, 4.390,
##D 1.988, 2.874, 4.845, 4.894, 6.080,
##D 2.429, 3.588, 4.894, 6.951, 7.476,
##D 3.031, 4.390, 6.080, 7.476, 10.313), nrow=5)
##D 
##D 
##D CFA.1(N=300, S=cov.mat, package="lavaan")
##D 
##D CFA.1(N=300, S=cov.mat, package="sem")
##D 
## End(Not run)



