library(spatstat)


### Name: panel.contour
### Title: Panel Plots using Colour Image or Contour Lines
### Aliases: panel.contour panel.image panel.histogram
### Keywords: spatial hplot

### ** Examples

  pairs(bei.extra,
        panel      = panel.contour,
        diag.panel = panel.histogram)
  with(bei.extra,
        pairs(grad, elev, 
              panel      = panel.image,
              diag.panel = panel.histogram))
  pairs(marks(finpines), panel=panel.contour, diag.panel=panel.histogram)



