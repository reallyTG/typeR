library(saeRobust)


### Name: mse
### Title: Compute the Mean Squared Error of an Estimator
### Aliases: mse mse.fitrfh

### ** Examples

data("grapes", package = "sae")
data("grapesprox", package = "sae")

fitRFH <- rfh(
  grapehect ~ area + workdays - 1,
  data = grapes,
  samplingVar = "var"
)

mseRFH <- mse(fitRFH)
plot(mseRFH)



