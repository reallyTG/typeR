library(FSMUMI)


### Name: compute.fa2
### Title: FA2
### Aliases: compute.fa2

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[, 1] ; Y <- dataFSMUMI[, 2]
compute.fa2(Y,X)
compute.fa2(Y,X, verbose = TRUE)

# By definition, if pairs of true and imputed values are zero,
# FA2 corresponding to this pair of values equals 1.
X[1] <- 0
Y[1] <- 0
compute.fa2(Y,X)



