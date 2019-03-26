library(RXshrink)


### Name: RXuclars
### Title: Maximum Likelihood Least Angle Regression on Uncorrelated
###   X-Components
### Aliases: RXuclars
### Keywords: regression

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxuobj <- RXuclars(form, data=longley2)
  rxuobj
  plot(rxuobj)
  str(rxuobj)



