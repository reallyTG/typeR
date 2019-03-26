library(ghyp)


### Name: plot-lines-methods
### Title: Plot univariate generalized hyperbolic densities
### Aliases: plot.ghyp plot,ghyp,missing-method plot-methods lines.ghyp
###   lines-methods lines,ghyp-method
### Keywords: hplot methods

### ** Examples

  data(smi.stocks)

  smi.fit   <-  fit.tuv(data = smi.stocks[,"SMI"], symmetric = TRUE)
  nestle.fit <- fit.tuv(data = smi.stocks[,"Nestle"], symmetric = TRUE)

  ## Student-t distribution
  plot(smi.fit, type = "l", log = "y")
  lines(nestle.fit, col = "blue")

  ## Empirical
  lines(density(smi.stocks[,"SMI"]), lty = "dashed")
  lines(density(smi.stocks[,"Nestle"]), lty = "dashed", col = "blue")



