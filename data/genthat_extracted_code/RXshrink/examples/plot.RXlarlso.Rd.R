library(RXshrink)


### Name: plot.RXlarlso
### Title: Plot method for RXlarlso objects
### Aliases: plot.RXlarlso
### Keywords: trace

### ** Examples

  data(longley2)
  form <- GNP~GNP.deflator+Unemployed+Armed.Forces+Population+Year+Employed
  rxlobj <- RXlarlso(form, data=longley2)
  plot(rxlobj)



