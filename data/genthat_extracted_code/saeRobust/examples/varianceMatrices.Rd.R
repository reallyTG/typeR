library(saeRobust)


### Name: matU
### Title: Matrix constructor functions
### Aliases: matU matTrace matB matBConst matA matAConst matW matWbc matTZ
###   matTZ1

### ** Examples

data("grapes", package = "sae")
data("grapesprox", package = "sae")

fitRFH <- rfh(
  grapehect ~ area + workdays - 1,
  data = grapes,
  samplingVar = "var"
)

matV <- variance(fitRFH)

# matU:
matU(matV$V())$U()
matU(matV$V())$sqrt()
matU(matV$V())$sqrtInv()

# matB (and matA + matW accordingly):
matB(
  fitRFH$y,
  fitRFH$x,
  fitRFH$coefficients,
  fitRFH$re,
  matV,
  function(x) psiOne(x, k = fitRFH$k)
)

matBConst(
  fitRFH$y,
  fitRFH$x,
  fitRFH$coefficients,
  matV,
  function(x) psiOne(x, k = fitRFH$k)
)(fitRFH$re)

# construcors for 'Z' in linear mixed models
matTZ(2, 3)
matTZ1(2, 3)



