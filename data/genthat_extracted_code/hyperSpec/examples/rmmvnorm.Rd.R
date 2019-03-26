library(hyperSpec)


### Name: rmmvnorm
### Title: Multivariate normal random numbers
### Aliases: rmmvnorm rmmvnorm,numeric,hyperSpec,matrix-method rmmvnorm
###   rmmvnorm,hyperSpec-method rmmvnorm,numeric,hyperSpec,array-method
###   rmmvnorm,numeric,matrix,matrix-method
###   rmmvnorm,numeric,matrix,array-method

### ** Examples

## multiple groups, common covariance matrix

if (require ("mvtnorm")){
   pcov <- pooled.cov (chondro, chondro$clusters)
   rnd <- rmmvnorm (rep (10, 3), mean = pcov$mean, sigma = pcov$COV)
   plot (rnd, col = rnd$.group)
}



