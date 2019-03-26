library(R2MLwiN)


### Name: diag1
### Title: Examination dataset
### Aliases: diag1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(diag1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(n_ilea ~ 1 + n_vrq + (1 + n_vrq | school) + (1 | pupil),
##D   estoptions = list(resi.store = TRUE, resioptions = c("standardised",
##D   "leverage", "influence", "deletion")), data = diag1))
##D 
## End(Not run)



