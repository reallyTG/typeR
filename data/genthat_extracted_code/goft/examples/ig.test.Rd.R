library(goft)


### Name: ig_test
### Title: Tests for the Inverse Gaussian distribution
### Aliases: ig_test
### Keywords: htest

### ** Examples

# Example 1: testing the inverse Gaussian distribution hypothesis  using "transf" 
# option on the compressive strength variable of the strength data set.
data("strength")
y <- strength$cstrength        # compressive strength
ig_test(y, method = "transf")

# Getting the p-value of the test based on a transformation to gamma variables
ig_test(y)[[2]]$p.value 

# Example 2: testing the inverse Gaussian distribution hypothesis  using "ratio" 
# option on a simulated data set.
x <- rlnorm(500)    # simulating a random sample from the lognormal distribution
ig_test(x, method = "ratio") 




