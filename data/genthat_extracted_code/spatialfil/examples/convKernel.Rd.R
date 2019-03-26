library(spatialfil)


### Name: convKernel
### Title: Function for creating convolution kernel for different filters
### Aliases: convKernel

### ** Examples

## Not run:
# creates a convolution kernel with Gaussian function and sigma = 1.4
K <- convKernel(sigma = 1.4, k = 'gaussian')
plot(K)
## End(**Not run**)



