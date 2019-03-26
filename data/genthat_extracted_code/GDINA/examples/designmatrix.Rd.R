library(GDINA)


### Name: designmatrix
### Title: Generate design matrix
### Aliases: designmatrix

### ** Examples

## Not run: 
##D designmatrix(Kj = 2, model = "GDINA")
##D designmatrix(Kj = 3, model = "DINA")
##D msQj <- matrix(c(1,0,0,1,
##D                  1,1,0,0),nrow=2,byrow=TRUE)
##D designmatrix(model = "MSDINA",Qj = msQj)
## End(Not run)




