library(bootruin)


### Name: ruinprob.test
### Title: A Bootstrap Test for the Probability of Ruin in the Classical
###   Risk Process
### Aliases: ruinprob.test
### Keywords: htest

### ** Examples

# Generating a sample of 50 exponentially distributed claims with mean 10
x <- rexp(50, 0.1)

## Not run: 
##D # Given this sample, test whether the probability of ruin is smaller than
##D # 0.1 using a bootstrap test with 100 bootstrap replications.
##D ruinprob.test(
##D     x = x, prob.null = 0.10, type = "bootstrap",
##D     loading = 0.2, reserve = 100, interval = 1,
##D     bootmethod = "nonp", nboot = 100
##D )
## End(Not run)

# The same test using normal approximation. This is a lot faster.
ruinprob.test(
    x = x, prob.null = 0.15, type = "normal",
    loading = 0.2, reserve = 100, interval = 1
)



