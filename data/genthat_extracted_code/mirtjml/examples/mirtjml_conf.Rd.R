library(mirtjml)


### Name: mirtjml_conf
### Title: Constrained joint maximum likelihood estimation for confirmatory
###   item factor analysis on the multidimensional two parameter logistic
###   model.
### Aliases: mirtjml_conf

### ** Examples

# load a simulated dataset
attach(data_sim)

# generate starting values for the algorithm
A0 <- Q
d0 <- rep(0, J)
theta0 <- matrix(rnorm(N*K, 0, 1),N)

# run the confirmatory analysis
res_conf <- mirtjml_conf(response, Q, theta0, A0, d0)





