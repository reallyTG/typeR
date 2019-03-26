library(bda)


### Name: fit.GB
### Title: Fitting GB
### Aliases: fit.GB print.GB plot.GB lines.GB
### Keywords: distribution stats

### ** Examples


  x <- rnorm(100, 34.5,1.5)
  hofc <- binning(x, bw=1)
  lmd7 <- fit.GB(hofc)
  plot(lmd7)
  gof(lmd7)





