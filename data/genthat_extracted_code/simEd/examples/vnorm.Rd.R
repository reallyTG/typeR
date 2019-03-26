library(simEd)


### Name: vnorm
### Title: Variate Generator for the Normal Distribution
### Aliases: vnorm Normal
### Keywords: distribution

### ** Examples

set.seed(8675309)
vnorm(3)  # generate standard normals: inverts stats::runif using stats::qnorm

set.seed(8675309)
vnorm(3, mean = 2, sd = 1)  # inverts stats::runif using stats::qnorm

set.seed(8675309)
vnorm(3, mean = 2, sd = 1, stream = 1) # inverts rstream::rstream.sample using stats::qnorm
vnorm(3, mean = 2, sd = 1, stream = 2)

set.seed(8675309)
vnorm(1, mean = 2, sd = 1, stream = 1) # inverts rstream::rstream.sample using stats::qnorm
vnorm(1, mean = 2, sd = 1, stream = 2)
vnorm(1, mean = 2, sd = 1, stream = 1)
vnorm(1, mean = 2, sd = 1, stream = 2)
vnorm(1, mean = 2, sd = 1, stream = 1)
vnorm(1, mean = 2, sd = 1, stream = 2)

set.seed(8675309)
variates <- vnorm(1000, mean = 10, sd = 2, stream = 1)
set.seed(8675309)
variates <- vnorm(1000, mean = 10, sd = 2, stream = 1, antithetic = TRUE)



