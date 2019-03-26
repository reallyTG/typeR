library(sme)


### Name: plotSmeModel
### Title: Visualisation of a fitted smoothing-splines mixed-effects model
### Aliases: plotSmeModel

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  plotSmeModel(fit,showIndividuals=FALSE)
  plotSmeModel(fit,showConfidenceBands=TRUE)



