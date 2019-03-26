library(spMC)


### Name: image.pemt
### Title: Images with Multi-directional Transiograms
### Aliases: image.pemt
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Compute a 2-D section of a
# multi-directional transiogram
psEmpTr <- pemt(ACM$MAT3, ACM[, 1:3], 2,
                max.dist = c(200, 200, 20), 
                which.dire=c(1, 3), 
                mle = "mlk")

# Plot 2-D sections of
# a multi-directional transiogram
image(psEmpTr, col = rev(heat.colors(500)), 
      breaks = 0:500 / 500, mar = .7,
      contour = FALSE)
## End(No test)


