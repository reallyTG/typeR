library(edpclient)


### Name: select
### Title: Fetch columns from a population or population model
### Aliases: select

### ** Examples

  ## Not run: 
##D     # similar to SQL "SELECT a, b FROM pm WHERE c = 4;"
##D     select(pm, c("a", "b"), where = list(c = 4))
##D 
##D     select(pm, c("a", "b"), rowids = c(7, 22))
##D   
## End(Not run)



