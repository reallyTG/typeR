library(MESS)


### Name: panel.r2
### Title: Panel plot of R2 values for pairs
### Aliases: panel.r2
### Keywords: iplot

### ** Examples


pairs(~ Ozone + Temp + Wind + Solar.R, data=airquality,
      lower.panel=panel.smooth, upper.panel=panel.r2)




