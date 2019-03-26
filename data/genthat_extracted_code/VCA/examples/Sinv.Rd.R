library(VCA)


### Name: Sinv
### Title: Calling C-implementation of the SWEEP-Operator for
###   Matrix-Inversion
### Aliases: Sinv

### ** Examples

## Not run: 
##D M <- matrix(c(4,-6,6,-9),2)
##D solve(m)			# regular inverse does not exist
##D Mi1 <- MPinv(M)			# MASS-implementation 'ginv'
##D Mi1
##D M %*% Mi1 %*% M			# should be M
##D Mi2 <- VCA:::Sinv(M)
##D Mi2
##D M %*% Mi2 %*% M			# should be M
## End(Not run)



