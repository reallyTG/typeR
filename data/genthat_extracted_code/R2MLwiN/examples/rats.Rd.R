library(R2MLwiN)


### Name: rats
### Title: Weights of 30 rats, measured weekly over 5 weeks.
### Aliases: rats
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(rats, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(c(y8, y15, y22, y29, y36) ~ 1 + (1 | rat), 
##D   D = "Multivariate Normal", estoptions = list(EstM = 1),
##D   data = rats))
##D 
## End(Not run)



