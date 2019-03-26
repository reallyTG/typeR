library(adegraphics)


### Name: s.density
### Title: 2-D scatter plot with kernel density estimation
### Aliases: s.density
### Keywords: hplot aplot

### ** Examples

xx2 <- c(rnorm(50000, 1, 1), rnorm(50000, -1, 1))
yy2 <- c(rnorm(50000, -1, 0.5), rnorm(50000, 1, 0.5))
s.density(cbind(xx2, yy2), paxes.draw = TRUE, gridsize = c(200, 200), region = TRUE, 
  contour = TRUE, plabels.cex = 0, threshold = 0.05, nclass = 3, 
  col = colorRampPalette(c("lightgrey", "black"))(100))



