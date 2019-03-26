library(circular)


### Name: kuiper.test
### Title: Kuiper's Test
### Aliases: kuiper.test print.kuiper.test
### Keywords: htest

### ** Examples

# Generate data from the uniform distribution on the circle.
data <- circular(runif(100, 0, 2*pi))
kuiper.test(data)
# Generate data from the von Mises distribution.
data <- rvonmises(n=100, mu=circular(0), kappa=3)
kuiper.test(data, alpha=0.01)



