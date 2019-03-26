library(FSMUMI)


### Name: compute.fb
### Title: Fractional Bias (FB)
### Aliases: compute.fb

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[, 1] ; Y <- dataFSMUMI[, 2]
compute.fb(Y,X)
compute.fb(Y,X, verbose = TRUE)

# If mean(X)=mean(Y)=0, it is impossible to estimate FB,
# unless both true and imputed values vectors are constant.
# By definition, in this case, FB = 0.
X <- rep(0, 10) ; Y <- rep(0, 10)
compute.fb(Y,X)

# If true and imputed values are not zero and are opposed, FB = Inf.
X <- rep(runif(1), 10)
Y <- -X
compute.fb(Y,X)



