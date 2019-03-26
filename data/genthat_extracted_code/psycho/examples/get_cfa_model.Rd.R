library(psycho)


### Name: get_cfa_model
### Title: Get CFA model.
### Aliases: get_cfa_model

### ** Examples

## Not run: 
##D library(psycho)
##D 
##D x <- psych::fa(psych::Thurstone.33, 2)
##D loadings <- format_loadings(x)$loadings
##D get_cfa_model(loadings, treshold = "max")
##D get_cfa_model(loadings, treshold = 0.1)
## End(Not run)




