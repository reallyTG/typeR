library(bayesSurv)


### Name: give.summary
### Title: Brief summary for the chain(s) obtained using the MCMC.
### Aliases: give.summary
### Keywords: univar

### ** Examples

## Example with a sample stored in a vector:
sample <- rnorm(1000)
give.summary(sample)

## Example with a sample stored in a data.frame:
sample <- data.frame(x=rnorm(1000), y=rgamma(1000, shape=1, rate=1))
give.summary(sample)



