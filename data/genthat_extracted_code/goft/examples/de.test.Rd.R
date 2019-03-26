library(goft)


### Name: laplace_test
### Title: Tests for the Laplace or double exponential distribution
### Aliases: laplace_test
### Keywords: htest

### ** Examples

# Example 1:  testing the Laplace distribution hypothesis using "transf" option
x <- rnorm(50)   # simulating a random sample from a normal distribution
laplace_test(x)    

# Example 2: testing the Laplace distribution hypothesis using "ratio" option
x <- rt(60,4)    # simulating a random sample from Student's t distribution with 4 d.f.
laplace_test(x, method = "ratio")




