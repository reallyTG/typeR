library(spatialfil)


### Name: applyFilter
### Title: Function for applying convolution kernel to a matrix or array
### Aliases: applyFilter

### ** Examples

## Not run:
M <- array(runif(1000000), dim = c(100,100,100))
# smooth the array M
Mfil <- applyFilter(x = M, kernel = convKernel(sigma = 1.4, k = 'gaussian'))
image(M[,,50], col = grey(1:1000/1000))
image(Mfil[,,50], col = grey(1:1000/1000))

# now combining two filters in cascade
Mfil <- applyFilter(x = applyFilter(x = M, kernel = convKernel(k = 'sobel')),
                    kernel = convKernel(sigma = 1.4, k = 'gaussian'))
image(Mfil[,,50], col = grey(1:1000/1000))
## End(**Not run**)



