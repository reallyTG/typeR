library(sfsmisc)


### Name: linesHyperb.lm
### Title: Plot Confidence or Prediction Hyperbolas around a Regression
###   Line
### Aliases: linesHyperb.lm
### Keywords: regression aplot

### ** Examples

data(swiss)
      plot(Fertility ~ Education, data = swiss) # the data
(lmS <- lm(Fertility ~ Education, data = swiss))
linesHyperb.lm(lmS)
linesHyperb.lm(lmS, conf=TRUE, col="blue")



