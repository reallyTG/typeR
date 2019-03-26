library(smoothSurv)


### Name: eval.Gspline
### Title: Evaluate a G-spline in a grid of values
### Aliases: eval.Gspline
### Keywords: dplot

### ** Examples

  spline <- minPenalty(knots=seq(-4.2, 4.2, by=0.3), sdspline=0.2, difforder=3)$spline
  values <- eval.Gspline(spline, seq(-4.5, 4.5, by=0.05))
  plot(values, type="l", bty="n", lwd=3)



