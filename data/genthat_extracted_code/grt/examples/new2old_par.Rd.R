library(grt)


### Name: new2old_par
### Title: Convert 'new' to 'old' glcStruct format
### Aliases: new2old_par angle2cart
### Keywords: misc

### ** Examples

m <- list(c(187, 142), c(213.4, 97.7))
covs <- diag(c(625, 625))
foo <- ldb(means=m, covs=covs)
bar <- old2new_par(foo)
new2old_par(bar)

angle2cart(bar$angle)



