library(BEST)


### Name: postPriorOverlap
### Title: Overlap between posterior and prior probability distributions.
### Aliases: postPriorOverlap

### ** Examples

# Generate some data
tst <- rbeta(1e6, 5, 7)

# check overlap with a Beta(0.2, 0.2) prior:
postPriorOverlap(tst, dbeta, shape1=0.2, shape2=0.2)

# check overlap with a Uniform(0, 1) prior:
postPriorOverlap(tst, runif(1e6))




