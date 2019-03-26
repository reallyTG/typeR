library(futile.matrix)


### Name: rmatrix
### Title: Generation of random matrices
### Aliases: eigenvalues hermitian max_eigen rmatrix symmetric

### ** Examples

model <- WignerModel(10)
m <- rmatrix(model)

## Not run: 
##D e <- Ensemble(20, model)
##D hist(max_eigen(e), freq=FALSE)
## End(Not run)



