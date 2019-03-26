library(RXshrink)


### Name: RXsigns
### Title: Normal-theory Maximum Likelihood Estimation of Beta Coefficients
###   with "Correct" Signs
### Aliases: RXsigns
### Keywords: regression

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxsobj <- RXsigns(form, data=longley2)
  rxsobj
  str(rxsobj)



