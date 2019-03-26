library(fastclime)


### Name: dantzig
### Title: A solver for the Dantzig selector estimator
### Aliases: dantzig

### ** Examples


#generate data
a = dantzig.generator(n = 200, d = 100, sparsity = 0.1)

#regression coefficient estimation
b = dantzig(a$X0, a$y, lambda = 0.1, nlambda = 100)




