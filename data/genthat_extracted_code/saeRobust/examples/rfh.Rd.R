library(saeRobust)


### Name: rfh
### Title: Robust Fay Herriot Model
### Aliases: rfh rfh rfh,formula,data.frame,character,ANY-method
###   predict.fitrfh

### ** Examples


# Non-temporal models:
data("grapes", package = "sae")
data("grapesprox", package = "sae")

fitRFH <- rfh(
  grapehect ~ area + workdays - 1,
  data = grapes,
  samplingVar = "var"
)

fitRFH
summary(fitRFH)

plot(fitRFH)
plot(predict(fitRFH))
plot(mse(fitRFH))

## Not run: 
##D # And the same including a spatial structure:
##D fitRSFH <- rfh(
##D   grapehect ~ area + workdays - 1,
##D   data = grapes,
##D   samplingVar = "var",
##D   corSAR1(as.matrix(grapesprox))
##D )
##D 
##D # Use the same methods, e.g. plot, for all these implementations:
##D data("spacetime", package = "sae")
##D data("spacetimeprox", package = "sae")
##D nTime <- length(unique(spacetime$Time))
##D 
##D fitRTFH <- rfh(
##D   Y ~ X1 + X2,
##D   spacetime,
##D   "Var",
##D   corAR1(nTime = nTime)
##D )
##D 
##D fitRSTFH <- rfh(
##D   Y ~ X1 + X2,
##D   spacetime,
##D   "Var",
##D   corSAR1AR1(W = as.matrix(spacetimeprox), nTime = nTime)
##D )
## End(Not run)



