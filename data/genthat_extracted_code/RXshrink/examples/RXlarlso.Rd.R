library(RXshrink)


### Name: RXlarlso
### Title: Maximum Likelihood Estimation of Effects in Least Angle
###   Regression
### Aliases: RXlarlso
### Keywords: regression

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxlobj <- RXlarlso(form, data=longley2)
  rxlobj
  plot(rxlobj)
  str(rxlobj)



