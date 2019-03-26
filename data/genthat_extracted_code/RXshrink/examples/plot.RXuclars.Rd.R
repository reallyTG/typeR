library(RXshrink)


### Name: plot.RXuclars
### Title: Plot method for RXuclars objects
### Aliases: plot.RXuclars
### Keywords: trace

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxuobj <- RXuclars(form, data=longley2)
  plot(rxuobj)



