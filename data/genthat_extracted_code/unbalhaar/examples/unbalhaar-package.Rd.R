library(unbalhaar)


### Name: unbalhaar-package
### Title: Function estimation via Unbalanced Haar wavelets
### Aliases: unbalhaar-package unbalhaar
### Keywords: package

### ** Examples

x <- c(rep(0, 100), rep(1, 200)) + rnorm(300)
est.topdown <- uh(x)
est.bottomup <- uh.bu(x)



