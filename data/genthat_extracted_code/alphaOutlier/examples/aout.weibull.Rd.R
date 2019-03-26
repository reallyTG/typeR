library(alphaOutlier)


### Name: aout.weibull
### Title: Find alpha-outliers in Weibull data
### Aliases: aout.weibull
### Keywords: distribution

### ** Examples

# lifetime data example taken from Table 2.2, Dodson (2006)
temp <- c(12.5, 24.4, 58.2, 68.0, 69.1, 95.5, 96.6, 97.0, 
          114.2, 123.2, 125.6, 152.7)
aout.weibull(temp, c(2.25, 97), 0.1)



