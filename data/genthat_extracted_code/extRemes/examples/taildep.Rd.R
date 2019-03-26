library(extRemes)


### Name: taildep
### Title: Tail Dependence
### Aliases: taildep
### Keywords: multivariate

### ** Examples

##
## Example where a r.v. is completely dependent in
## terms of the variables, but completely tail
## independent (see Reiss and Thomas p. 75).
z <- runif(100, -1, 0)
w <- -1*(1 + z)
taildep(z,w,u=0.8)

## Not run: 
##D data(FCwx)
##D taildep(FCwx$MxT, FCwx$MnT, 0.8)
##D taildep(FCwx$MxT, FCwx$Prec, 0.8)
## End(Not run)



