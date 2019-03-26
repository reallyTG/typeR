library(spMC)


### Name: pemt
### Title: Multi-directional Transiograms Estimation
### Aliases: pemt
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)

# Compute a 2-D section of a
# multi-directional transiogram
pemt(ACM$MAT3, ACM[, 1:3], 2,
     max.dist = c(200, 200, 20), 
     which.dire=c(1, 3), mle = "mdn")
## End(No test)


