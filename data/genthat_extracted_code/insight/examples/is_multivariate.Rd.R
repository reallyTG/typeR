library(insight)


### Name: is_multivariate
### Title: Checks if an object stems from a multivariate response model
### Aliases: is_multivariate

### ** Examples

## Not run: 
##D library(rstanarm)
##D data("pbcLong")
##D model <- stan_mvmer(
##D   formula = list(
##D     logBili ~ year + (1 | id),
##D     albumin ~ sex + year + (year | id)
##D   ),
##D   data = pbcLong,
##D   chains = 1, cores = 1, seed = 12345, iter = 1000
##D )
##D 
##D f <- find_formula(model)
##D is_multivariate(model)
##D is_multivariate(f)
## End(Not run)



