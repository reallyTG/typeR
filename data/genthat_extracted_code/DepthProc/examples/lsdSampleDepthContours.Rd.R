library(DepthProc)


### Name: lsdSampleDepthContours
### Title: Calculate sample Mizera and Muller Student depth contours
### Aliases: lsdSampleDepthContours

### ** Examples

# EXAMPLE 1
# F-distribution
dcont <- lsdSampleDepthContours(rf(200, 4, 7))
plot(dcont)

# EXAMPLE 2
# normal distribution - more contours calculated
dcont_norm <- lsdSampleDepthContours(rnorm(100), seq(0.05, 0.4, 0.05))
plot(dcont_norm)




