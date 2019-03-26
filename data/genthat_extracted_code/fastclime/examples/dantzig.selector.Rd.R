library(fastclime)


### Name: dantzig.selector
### Title: Dantzig selector
### Aliases: dantzig.selector

### ** Examples


# generate data
a = dantzig.generator(n = 200, d = 100, sparsity = 0.1)

# regression coefficient estimation
b = dantzig(a$X0, a$y, lambda = 0.1, nlambda = 100)

# estimated regression coefficient vector
c = dantzig.selector(b$lambdalist, b$BETA0, 15)




