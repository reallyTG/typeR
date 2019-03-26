library(crqa)


### Name: lorenzattractor
### Title: Simulate the Lorenz Attractor
### Aliases: lorenzattractor
### Keywords: ts

### ** Examples


## initialize the parameters
numsteps = 2 ^ 11; dt = .01; sigma = 10; r = 28; b = 8/3;
plots = TRUE

res = lorenzattractor(numsteps, dt, sigma, r, b, plots)




