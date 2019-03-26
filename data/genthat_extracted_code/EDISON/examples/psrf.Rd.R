library(EDISON)


### Name: psrf
### Title: Calculates the potential scale reduction factor.
### Aliases: psrf

### ** Examples


# Generate 5 'runs' of random samples from Gaussian N(0,1)
samples = list()

for(run in 1:5) {
  samples[[run]] = matrix(rnorm(1000), 1, 1000)
}

# Check potential scale reduction factor
# (Will be very close to 1 due to the samples being from 
# the same distribution)
psrf.val = psrf(samples)


# Now use slightly different Gaussian distributions for each 'run'.
for(run in 1:5) {
  mean = runif(1, 0, 2)
  samples[[run]] = matrix(rnorm(1000, mean, 1), 1, 1000)
}

# Check potential scale reduction factor
# (Should be > 1.1)
psrf.val = psrf(samples)





