library(RXshrink)


### Name: plot.RXtrisk
### Title: Plot method for RXtrisk objects
### Aliases: plot.RXtrisk
### Keywords: trace

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  # set true regression parameter values not unlike their OLS estimates from RXridge().
  trugam <- matrix(c(.5,-.1,.2,.2,.2,-.2),6,1)
  trusig <- 0.04
  rxtobj <- RXtrisk(form, data=longley2, trugam, trusig, Q=-1.5)
  plot(rxtobj)



