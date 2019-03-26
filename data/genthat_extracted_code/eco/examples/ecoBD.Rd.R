library(eco)


### Name: ecoBD
### Title: Calculating the Bounds for Ecological Inference in RxC Tables
### Aliases: ecoBD
### Keywords: models

### ** Examples



## load the registration data
data(reg)

## calculate the bounds
res <- ecoBD(Y ~ X, N = N, data = reg)
## print the results
print(res)




