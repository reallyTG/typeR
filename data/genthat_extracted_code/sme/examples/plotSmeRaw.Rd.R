library(sme)


### Name: plotSmeRaw
### Title: Visualisation of raw data for a smoothing-splines mixed-effects
###   model
### Aliases: plotSmeRaw

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  plotSmeRaw(fit,showModelFits=FALSE)
  plotSmeRaw(fit,showModelFits=FALSE,showRawLines=TRUE)
  plotSmeRaw(fit)



