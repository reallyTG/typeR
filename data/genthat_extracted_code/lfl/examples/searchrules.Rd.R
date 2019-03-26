library(lfl)


### Name: searchrules
### Title: Searching for fuzzy association rules
### Aliases: searchrules
### Keywords: models robust multivariate

### ** Examples

  d <- lcut3(CO2)
  searchrules(d, lhs=1:ncol(d), rhs=1:ncol(d))



