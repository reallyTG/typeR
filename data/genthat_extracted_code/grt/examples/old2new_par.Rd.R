library(grt)


### Name: old2new_par
### Title: Convert 'old' to 'new' glcStruct format
### Aliases: old2new_par cart2angle
### Keywords: misc

### ** Examples

m <- list(c(187, 142), c(213.4, 97.7))
covs <- diag(c(625, 625))
foo <- ldb(means=m, covs=covs)
old2new_par(foo)

cart2angle(foo$coeffs)



