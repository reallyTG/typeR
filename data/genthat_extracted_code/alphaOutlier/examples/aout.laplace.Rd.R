library(alphaOutlier)


### Name: aout.laplace
### Title: Find alpha-outliers in Laplace / double exponential data
### Aliases: aout.laplace
### Keywords: distribution

### ** Examples

# Using the flood data from Dumonceaux and Antle (1973):
temp <- c(0.265, 0.269, 0.297, 0.315, 0.3225, 0.338, 0.379, 0.380, 0.392, 0.402,
         0.412, 0.416, 0.418, 0.423, 0.449, 0.484, 0.494, 0.613, 0.654, 0.74)
aout.laplace(temp, c(median(temp), median(abs(temp - median(temp)))), 0.05)



