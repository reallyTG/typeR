library(MFPCA)


### Name: dctFunction2D
### Title: Calculate linear combinations of orthonormal cosine basis
###   functions on two- or three-dimensional domains
### Aliases: dctFunction2D dctFunction3D
### Keywords: internal

### ** Examples

# set seed
set.seed(12345)

# generate sparse 10 x 15 score matrix (i.e. 10 observations) with 30 entries
# smoothness assumption: higher order basis functions (high column index) have lower probability
scores <- Matrix::sparseMatrix(i = sample(1:10, 30, replace = TRUE), # sample row indices
     j = sample(1:15, 30, replace = TRUE, prob = 1/(1:15)), # sample column indices
     x = rnorm(30)) # sample values
scores

## Not run: 
##D # calculate basis expansion on [0,1] x [0,1]
##D f <- MFPCA:::dctFunction2D(scores = scores, argvals = list(seq(0,1,0.01), seq(0,1,0.01)))
##D nObs(f) # f has 10 observations
##D 
##D oldPar <- par(no.readonly = TRUE)
##D par(mfrow = c(1,1))
##D 
##D plot(f, obs = 1) # plot first observation
##D plot(f, obs = 2) # plot second observation
##D 
##D par(oldPar)
## End(Not run)



