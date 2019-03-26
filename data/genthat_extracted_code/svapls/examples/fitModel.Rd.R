library(svapls)


### Name: fitModel
### Title: Function to fit an ANCOVA model to the log transformed gene
###   expression data, with a certain specified number of surrogate
###   variables.
### Aliases: fitModel
### Keywords: models classes print methods

### ** Examples

data(hidden_fac.dat)

## Fitting an ANCOVA model with 5 surrogate variables
fit <- fitModel(10,10,hidden_fac.dat,n.surr = 5)
print(fit)




