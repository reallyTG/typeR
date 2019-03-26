library(cvequality)


### Name: mslr_test
### Title: Modified signed-likelihood ratio test (SLRT) for equality of
###   CVs, using measurement data
### Aliases: mslr_test

### ** Examples


 x <- rnorm(100)
 y <- unlist(lapply(letters[1:5], function(i) rep(i, 20)))

 mslr_test(nr = 1e3, x, y)





