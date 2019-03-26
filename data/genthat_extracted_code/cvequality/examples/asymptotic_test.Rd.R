library(cvequality)


### Name: asymptotic_test
### Title: Asymptotic test for the equality of coefficients of variation
###   from k populations, using measurement data
### Aliases: asymptotic_test

### ** Examples


 y <- unlist(lapply(letters[1:5], function(i) rep(i, 20)))
 x <- rnorm(100)

 asymptotic_test(x, y)




