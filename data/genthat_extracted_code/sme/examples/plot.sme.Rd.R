library(sme)


### Name: plot.sme
### Title: Visualisation of smoothing-splines mixed-effects models
### Aliases: plot.sme

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  plot(fit,type="model")
  plot(fit,type="raw")
  plot(fit,type="diagnostic")



