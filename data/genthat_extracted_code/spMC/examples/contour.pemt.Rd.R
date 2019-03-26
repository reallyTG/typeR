library(spMC)


### Name: contour.pemt
### Title: Display Contours with Multi-directional Transiograms
### Aliases: contour.pemt
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Compute a 2-D section of a 
# multi-directional transiogram
psEmpTr <- pemt(ACM$MAT3, ACM[, 1:3], 2,
                max.dist = c(200, 200, 20), 
                which.dire=c(1, 3), 
                mle = "avg")

# Contour plots of 2-D sections of 
# multi-directional transiograms
contour(psEmpTr, mar = .7)
## End(No test)


