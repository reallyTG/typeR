library(mrgsolve)


### Name: omega
### Title: Manipulate OMEGA matrices
### Aliases: omega omat OMEGA omat,missing-method omat,matrix-method
###   omat,NULL-method omat,list-method omat,omegalist-method
###   omat,mrgmod-method omat,mrgsims-method

### ** Examples

## example("omega")
mat1 <- matrix(1)
mat2 <- diag(c(1,2,3))
mat3 <- matrix(c(0.1, 0.002, 0.002, 0.5), 2,2)
mat4 <- dmat(0.1, 0.2, 0.3, 0.4)

omat(mat1)
omat(mat1, mat2, mat3)
omat(A=mat1, B=mat2, C=mat3)

mod <- mrgsolve:::house() %>% omat(mat4)

omat(mod)
omat(mod, make=TRUE)


## Not run: 
##D 
##D $OMEGA
##D 1 2 3
##D 
##D $OMEGA @block
##D 1 0.1 2
##D 
##D $OMEGA \@cor
##D \@ prefix ETA_
##D \@ labels CL VC KA
##D 0.1
##D 0.67 0.2
##D 0 0 0.3
##D 
## End(Not run)



