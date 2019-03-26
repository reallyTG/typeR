library(NMFN)


### Name: nnmf_mm
### Title: Non-negative Matrix Factorization via multiplicative update
### Aliases: nnmf_mm

### ** Examples
 
X <- matrix(1:12, 3, 4)

results <- nnmf(X, 2)
#which is equivalent to
results <- nnmf(X, 2, 'nnmf_mm')



