library(multimode)


### Name: nmodes
### Title: Number of modes
### Aliases: nmodes
### Keywords: mode estimation

### ** Examples

# Number of modes in the interval (-1.5,1.5), using the bandwidth 0.5.
set.seed(2016)
data=rnorm(50)
nmodes(data,0.5,-1.5,1.5)



