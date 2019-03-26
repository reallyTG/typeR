library(saeRobust)


### Name: score
### Title: Compute values of robust score functions
### Aliases: score

### ** Examples

data("grapes", package = "sae")

fitRFH <- rfh(
  grapehect ~ area + workdays - 1,
  data = grapes,
  samplingVar = "var"
)

score(fitRFH)



