library(FSMUMI)


### Name: compute.fsd
### Title: Fraction of Standard Deviation (FSD)
### Aliases: compute.fsd

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[, 1] ; Y <- dataFSMUMI[, 2]
compute.fsd(Y,X)
compute.fsd(Y,X, verbose = TRUE)

# By definition, if true and imputed values are equal and constant,
# FSD = 0.
X <- rep(runif(1), 10)
Y <- X
compute.fsd(Y,X)

# However, if true and imputed values are constant but different,
# FSD is not calculable. An error is displayed.
## Not run: 
##D X <- rep(runif(1), 10);Y <- rep(runif(1), 10)
##D compute.fsd(Y,X)
## End(Not run)



