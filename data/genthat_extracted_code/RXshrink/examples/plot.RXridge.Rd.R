library(RXshrink)


### Name: plot.RXridge
### Title: Plot method for RXridge objects
### Aliases: plot.RXridge
### Keywords: trace

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxrobj <- RXridge(form, data=longley2)
  plot(rxrobj)



