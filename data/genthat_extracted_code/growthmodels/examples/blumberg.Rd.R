library(growthmodels)


### Name: blumberg
### Title: Blumberg growth model
### Aliases: blumberg blumberg.inverse

### ** Examples

growth <- blumberg(0:10, 10, 2, 0.5)
# Calculate inverse function
time <- blumberg.inverse(growth, 12, 2, 0.5)



