library(omics)


### Name: mlm
### Title: Multiple Linear Models
### Aliases: mlm

### ** Examples

    coefs <- matrix(runif(6*10), 6, 10)
    X <- matrix(rnorm(100*5), 100, 5)
    Y <- cbind(1, X) 

    models <- mlm(Y ~ X)
    str(models)



