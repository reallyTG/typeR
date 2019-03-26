library(spMC)


### Name: persp.pemt
### Title: Perspective Plots with Multi-directional Transiograms
### Aliases: persp.pemt
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Compute a 2-D section of a
# multi-directional transiogram
psEmpTr <- pemt(ACM$MAT3, ACM[, 1:3], 2,
                max.dist = c(200, 200, 20), 
                which.dire = c(1, 3))

# 3D-Plot for a 2-D sections of
# a multi-directional transiogram
persp(psEmpTr, col = rainbow(500), mar = .7,
      theta = 15, phi = 45)
## End(No test)


