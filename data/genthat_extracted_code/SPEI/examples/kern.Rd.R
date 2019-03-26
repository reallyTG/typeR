library(SPEI)


### Name: Kernel functions
### Title: Time kernel for computing the SPEI at different time scales.
### Aliases: kern kern.plot

### ** Examples

# A rectangular kernel with a time scale of 12 and no shift
kern(12)

# A gaussian kernel with a time scale of 12 and no shift
kern(12,'gaussian')

# Comparison of the four kernels, with and without shift
kern.plot(12)
kern.plot(12,2)



