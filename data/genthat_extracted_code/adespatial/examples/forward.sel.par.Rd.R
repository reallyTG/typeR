library(adespatial)


### Name: forward.sel.par
### Title: Parametric forward selection of explanatory variables in
###   regression and RDA
### Aliases: forward.sel.par
### Keywords: multivariate

### ** Examples


x <- matrix(rnorm(30),10,3)
y <- matrix(rnorm(50),10,5)
    
forward.sel.par(y,x, alpha = 0.5)
 



