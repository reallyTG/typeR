library(m2r)


### Name: use_ring
### Title: Set Macaulay2 ring
### Aliases: use_ring

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D 
##D ##### basic usage
##D ########################################
##D 
##D ring("x", coefring = "QQ")
##D factor_poly("x^4 + 1")
##D 
##D QQtxyz <- ring("t","x","y","z", coefring = "QQ")
##D gb("t^4 - x", "t^3 - y", "t^2 - z")
##D 
##D ring("x", "y", "z", "t", coefring = "QQ")
##D gb("t^4 - x", "t^3 - y", "t^2 - z")
##D 
##D use_ring(QQtxyz)
##D gb("t^4 - x", "t^3 - y", "t^2 - z")
##D 
## End(Not run)



