library(RXshrink)


### Name: RXridge
### Title: Maximum Likelihood Shrinkage in Regression
### Aliases: RXridge
### Keywords: regression

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxrobj <- RXridge(form, data=longley2)
  rxrobj
  plot(rxrobj)
  str(rxrobj)



