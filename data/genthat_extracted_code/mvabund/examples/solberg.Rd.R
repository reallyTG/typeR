library(mvabund)


### Name: solberg
### Title: Solberg Data
### Aliases: solberg
### Keywords: datasets

### ** Examples

data(solberg)
solbergdat <- mvabund( solberg$abund )
treatment <- solberg$x

## Create a formula for multivariate abundance data:
foo.sol <- mvformula( solbergdat ~ treatment )

## Fit a multivariate linear model:
lm.solberg <- manylm(foo.sol)
lm.solberg



