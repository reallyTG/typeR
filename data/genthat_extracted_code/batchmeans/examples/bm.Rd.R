library(batchmeans)


### Name: bm
### Title: Perform consistent batch means estimation on a vector of values
###   from a Markov chain.
### Aliases: bm

### ** Examples


# Simulate a sample path of length 10,000 for an AR(1) chain with rho equal to 0.7.

X = numeric(10000)
X[1] = 1
for (i in 1:9999)
    X[i + 1] = 0.7 * X[i] + rnorm(1)

# Estimate the mean and MCSE.

bm(X)



