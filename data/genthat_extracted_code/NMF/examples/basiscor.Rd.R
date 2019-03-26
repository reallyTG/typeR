library(NMF)


### Name: basiscor
### Title: Correlations in NMF Models
### Aliases: basiscor basiscor,matrix,NMF-method basiscor-methods
###   basiscor,NMF,matrix-method basiscor,NMF,missing-method
###   basiscor,NMF,NMF-method profcor profcor,matrix,NMF-method
###   profcor-methods profcor,NMF,matrix-method profcor,NMF,missing-method
###   profcor,NMF,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate two random NMF models
a <- rnmf(3, 100, 20)
b <- rnmf(3, 100, 20)

# Compute auto-correlations
basiscor(a)
profcor(a)
# Compute correlations with b
basiscor(a, b)
profcor(a, b)

# try to recover the underlying NMF model 'a' from noisy data
res <- nmf(fitted(a) + rmatrix(a), 3)

# Compute correlations with the true model
basiscor(a, res)
profcor(a, res)

# Compute correlations with a random compatible matrix
W <- rmatrix(basis(a))
basiscor(a, W)
identical(basiscor(a, W), basiscor(W, a))

H <- rmatrix(coef(a))
profcor(a, H)
identical(profcor(a, H), profcor(H, a))



