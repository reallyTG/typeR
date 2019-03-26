library(OsteoBioR)


### Name: computeResult
### Title: Function to compute resulting isotopic values out of historic
###   ones
### Aliases: computeResult

### ** Examples

testDat <- data.frame(
  t = 1:3,
  bone = c(100, 50, 0),
  mean = c(1, 3, 50),
  sd = c(1, 3, 50)
)
  computeResult(
  data = testDat,
  timeVars = "t",
  boneVars = "bone",
  meanVar = "mean",
  sdVar = "sd"
)




