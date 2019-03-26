library(analogue)


### Name: residuals.prcurve
### Title: Residuals of a principal curve fit.
### Aliases: residuals.prcurve resid.prcurve
### Keywords: methods

### ** Examples

  ## Don't show: 
od <- options(digits = 4)
## End(Don't show)
  ## Load Abernethy Forest data set
  data(abernethy)

  ## Remove the Depth and Age variables
  abernethy2 <- abernethy[, -(37:38)]
  
  ## Fit the principal curve, preserving the data in the smooth.spline
  ## smooth functions fitted via keep.data = TRUE
  aber.pc <- prcurve(abernethy2, method = "ca", keep.data = TRUE)

  ## default "distance" residuals
  res <- resid(aber.pc)
  head(res)

  ## residuals from the underlying smooth models, also illustrates
  ## how to select specific types of residual from the individual
  ## method using argument 'type'
  res <- resid(aber.pc, which = "smooths", type = "deviance")
  dim(res)
  head(res[, 1:5])		# just show a few species residuals
  ## Don't show: 
options(od)
## End(Don't show)




