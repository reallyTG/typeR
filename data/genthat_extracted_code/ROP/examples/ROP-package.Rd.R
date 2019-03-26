library(ROP)


### Name: ROP-package
### Title: Regression Optimized: Numerical Approach for Multivariate
###   Classification and Regression Trees
### Aliases: ROP-package ROP
### Keywords: package

### ** Examples

rop(
  fic = system.file("extdata", "titanic.csv", package = "ROP"),
  output_folder = tempdir(),
  mini = -1,
  maxi = 1,
  nbCycles = 2,
  typesVariables = c(FALSE, FALSE, FALSE)
)



