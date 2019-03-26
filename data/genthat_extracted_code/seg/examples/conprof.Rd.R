library(seg)


### Name: conprof
### Title: Concentration Profile
### Aliases: conprof conprof.calc

### ** Examples

xx <- runif(100) # random distribution
xx <- xx * (4000 / sum(xx))
yy <- rep(c(40, 60), 100) # no segregation
zz <- rep(c(100, 0), c(40, 60)) # complete segregation

set1 <- cbind(xx, 100 - xx)
set2 <- matrix(yy, ncol = 2, byrow = TRUE)
set3 <- cbind(zz, 100 - zz)

par(mar = c(5.1, 4.1, 2.1, 2.1))
out1 <- conprof(set1, grpID = 1, 
  xlab = "Threshold level (%)", 
  ylab = "Population proportion (%)", 
  cex.lab = 0.9, cex.axis = 0.9, lty = "dotted")
out2 <- conprof(set2, grpID = 1, add = TRUE, 
  lty = "longdash")
out3 <- conprof(set3, grpID = 1, add = TRUE)
title(main = paste("R =", round(out1$d, 2)))

# shaded areas represent the summary statistic value
if (require(graphics)) {
  polygon(c(out1$x[1:400], 0.4, 0), 
          c(out1$y[1:400], 1, 1), 
          density = 10, angle = 60, 
          border = "transparent")
  polygon(c(out1$x[401:999], 1, 0.4), 
          c(out1$y[401:999], 0, 0), 
          density = 10, angle = 60, 
          border = "transparent")
}



