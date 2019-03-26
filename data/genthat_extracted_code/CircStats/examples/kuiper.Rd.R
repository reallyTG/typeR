library(CircStats)


### Name: kuiper
### Title: Kuiper's Test
### Aliases: kuiper
### Keywords: htest

### ** Examples

# Generate data from the uniform distribution on the circle.
data <- runif(100, 0, 2*pi)
kuiper(data)
# Generate data from the von Mises distribution.
data <- rvm(100, 0, 3)
kuiper(data, alpha=0.01)



