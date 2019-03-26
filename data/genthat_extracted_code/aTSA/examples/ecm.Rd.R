library(aTSA)


### Name: ecm
### Title: Error Correction Model
### Aliases: ecm

### ** Examples

X <- matrix(rnorm(200),100,2)
y <- 0.1*X[,1] + 2*X[,2] + rnorm(100)
ecm(y,X)



