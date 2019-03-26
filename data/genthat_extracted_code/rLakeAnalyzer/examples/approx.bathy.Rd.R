library(rLakeAnalyzer)


### Name: approx.bathy
### Title: Estimate hypsography curve
### Aliases: approx.bathy

### ** Examples

 
Voldev.ex = approx.bathy(Zmax = 25, Zmean = 12, lkeArea = 39400000, method = "voldev")
Voldevshallow.ex = approx.bathy(Zmax = 25, Zmean = 6, lkeArea = 39400000, method = "voldev")
Cone.ex = approx.bathy(Zmax = 25, lkeArea = 39400000, method = "cone")

# plot depth-area curves
  plot(Cone.ex$depths ~ Cone.ex$Area.at.z, xlab = "Area (m^3)", ylab = "Depth (m)")
  points(Voldev.ex$depths ~ Voldev.ex$Area.at.z, col = "red")
  points(Voldevshallow.ex$depths ~ Voldevshallow.ex$Area.at.z, col = "blue")
 




