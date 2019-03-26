library(EDISON)


### Name: rinvgamma
### Title: Samples from the inverse gamma distribution.
### Aliases: rinvgamma

### ** Examples


# Draw samples from inverse gamma distribution with shape parameter 1 
# and scale parameter 1
samples = rinvgamma(100, shape=1, scale=1)

# Calculate density of samples
densities = dinvgamma(samples, shape=1, scale=1)




