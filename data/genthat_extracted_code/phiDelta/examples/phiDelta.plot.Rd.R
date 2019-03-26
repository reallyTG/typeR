library(phiDelta)


### Name: phiDelta.plot
### Title: Plot of phi delta diagram
### Aliases: phiDelta.plot

### ** Examples

x <- climate_data
phiDelta <- phiDelta.stats(x[,-1],x[,1])
phiDelta.plot(phiDelta$phi, phiDelta$delta)
phiDelta.plot(phiDelta$phi, phiDelta$delta,
  ratio = phiDelta$ratio,
  border = "green",
  iso_neg_predictive_value = TRUE,
  crossing = FALSE)



