library(MESS)


### Name: panel.hist
### Title: Panel plot of histogram and density curve
### Aliases: panel.hist
### Keywords: iplot

### ** Examples


pairs(~ Ozone + Temp + Wind + Solar.R, data=airquality,
      lower.panel=panel.smooth, diag.panel=panel.hist,
      upper.panel=panel.r2)




