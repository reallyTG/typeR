library(RDS)


### Name: bootstrap.contingency.test
### Title: Performs a bootstrap test of independance between two
###   categorical variables
### Aliases: bootstrap.contingency.test

### ** Examples

data(faux)
bootstrap.contingency.test(rds.data=faux, row.var="X", col.var="Y",
  number.of.bootstrap.samples=50, verbose=FALSE)



