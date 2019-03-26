library(alphaOutlier)


### Name: aout.gandh
### Title: Find alpha-outliers in data from the family of g-and-h
###   distributions
### Aliases: aout.gandh
### Keywords: distribution

### ** Examples

durations <- faithful$eruptions
aout.gandh(durations, c(4.25, 1.14, 0.05, 0.05), alpha = 0.1)



