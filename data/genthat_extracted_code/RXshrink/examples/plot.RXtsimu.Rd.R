library(RXshrink)


### Name: plot.RXtsimu
### Title: Plot method for RXtsimu objects
### Aliases: plot.RXtsimu
### Keywords: trace

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  # set true regression parameter values not unlike their OLS estimates from RXridge().
  trugam <- matrix(c(.5,-.1,.2,.2,.2,-.2),6,1)
  trusig <- 0.04
  rxsobj <- RXtsimu(form, data=longley2, trugam, trusig, Q=-1.5)
  plot(rxsobj)



