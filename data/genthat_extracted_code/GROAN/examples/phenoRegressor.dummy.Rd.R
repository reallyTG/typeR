library(GROAN)


### Name: phenoRegressor.dummy
### Title: Regression dummy function
### Aliases: phenoRegressor.dummy

### ** Examples

#genotypes are not really investigated. Only
#number of test phenotypes is used.
phenoRegressor.dummy(
  phenotypes = c(1:10, NA, NA, NA),
  genotypes = matrix(nrow = 13, ncol=30)
)



