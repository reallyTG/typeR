library(R2MLwiN)


### Name: lips1
### Title: Lips data
### Aliases: lips1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(lips1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(log(obs) ~ 1 + perc_aff + offset(offs) + (0 | neigh1) + (1 | area),
##D  D = "Poisson", estoptions = list(EstM = 1), data = lips1))
##D 
## End(Not run)



