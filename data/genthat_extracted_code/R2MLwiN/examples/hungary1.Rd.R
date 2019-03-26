library(R2MLwiN)


### Name: hungary1
### Title: Hungarian component of 2nd International Science Survey, '84;
###   see Goldstein 2003
### Aliases: hungary1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(hungary1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(c(es_core, biol_core, biol_r3, biol_r4, phys_core, phys_r2) ~ 
##D   1 + female + (1 | school) + (1 | student),
##D   D = "Multivariate Normal", estoptions = list(EstM = 1), data = hungary1))
##D 
## End(Not run)



