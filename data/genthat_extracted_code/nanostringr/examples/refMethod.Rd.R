library(nanostringr)


### Name: refMethod
### Title: Reference-based approach for batch adjustment
### Aliases: refMethod

### ** Examples

set.seed(12)
A <- matrix(rnorm(120), ncol = 10)
B <- matrix(rnorm(80), ncol = 10)
C <- matrix(rnorm(50), ncol = 10)
refMethod(A, B, C)



