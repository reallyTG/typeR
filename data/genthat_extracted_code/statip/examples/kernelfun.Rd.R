library(statip)


### Name: kernel_properties
### Title: Smoothing kernels
### Aliases: kernel_properties kernelfun kernelfun.function
###   kernelfun.character .kernelsList

### ** Examples

kernel_properties("gaussian")

k <- kernelfun("epanechnikov")
curve(k(x), xlim = c(-1, 1))




