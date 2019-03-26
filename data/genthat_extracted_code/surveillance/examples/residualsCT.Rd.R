library(surveillance)


### Name: residualsCT
### Title: Extract Cox-Snell-like Residuals of a Fitted Point Process
### Aliases: residuals.twinSIR residuals.twinstim residuals.simEpidataCS
### Keywords: methods

### ** Examples

## Load the twinSIR() fit
data("foofit")
residuals(foofit)
## these residuals are, e.g., used by checkResidualProcess()
checkResidualProcess(foofit)



