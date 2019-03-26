library(batchmeans)


### Name: estvssamp
### Title: Create a plot that shows how Monte Carlo estimates change with
###   increasing sample size.
### Aliases: estvssamp

### ** Examples


# Simulate a sample path of length 10,000 for an AR(1) chain with rho equal to 0.7.

X = numeric(10000)
X[1] = 1
for (i in 1:9999)
    X[i + 1] = 0.7 * X[i] + rnorm(1)

# Plot MC estimates versus sample size.

estvssamp(X)



