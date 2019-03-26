library(adespatial)


### Name: forward.sel
### Title: Forward selection with multivariate Y using permutation under
###   reducel model
### Aliases: forward.sel
### Keywords: multivariate

### ** Examples


x <- matrix(rnorm(30),10,3)
y <- matrix(rnorm(50),10,5)
    
forward.sel(y,x,nperm=99, alpha = 0.5)
 



