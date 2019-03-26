library(pscl)


### Name: zeroinfl.control
### Title: Control Parameters for Zero-inflated Count Data Regression
### Aliases: zeroinfl.control
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")

## default start values
fm1 <- zeroinfl(art ~ ., data = bioChemists)

## use EM algorithm for start values
fm2 <- zeroinfl(art ~ ., data = bioChemists, EM = TRUE)

## user-supplied start values
fm3 <- zeroinfl(art ~ ., data = bioChemists,
  start = list(count = c(0.7, -0.2, 0.1, -0.2, 0, 0), zero = -1.7))



