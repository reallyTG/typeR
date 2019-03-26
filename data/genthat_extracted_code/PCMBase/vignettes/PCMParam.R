## ----setup---------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(abind)
library(PCMBase)

## ------------------------------------------------------------------------
modelObject <- structure(
  list(X0 = structure(c(0.0, 0.2),
                      class = c("VectorParameter", "_Global", "numeric")),
       Sigma = structure(abind(matrix(c(1,0,0,1), 2, 2),
                               matrix(c(2,0,0,2), 2, 2), along = 3),
                         class = c("MatrixParameter", "_UpperTriangularWithDiagonal", "_WithNonNegativeDiagonal", "matrix"))),
  class = c("PCM"),
  k = 2,
  regimes = 1:2)

PCMRegimes(modelObject)
PCMParamCount(modelObject)
PCMParamGetShortVector(modelObject)

vec <- double(PCMParamCount(modelObject))
PCMParamLoadOrStore(modelObject, vec, offset = 0, load=FALSE)
vec

modelObjectLowerLimit <- PCMParamLowerLimit(modelObject)
PCMParamLoadOrStore(modelObjectLowerLimit, vec, 0, load=FALSE)
vec

matParams <- PCMParamRandomVecParams(modelObject, n = 10)

matParamsX0 <- PCMParamRandomVecParams(modelObject$X0, 2, 2, n = 10)

matParamsSigma <- PCMParamRandomVecParams(modelObject$Sigma, 2, 2, n = 10)

## ------------------------------------------------------------------------
library(data.table)
OUModelDummy <- list()
class(OUModelDummy) <- c("OU")

listParameterizationsOU <- PCMListParameterizations(OUModelDummy)
dtParameterizations <- PCMTableParameterizations(OUModelDummy)

PCMGenerateParameterizations(OUModelDummy, tableParameterizations = dtParameterizations[1:10])

attr(OUModelDummy, "k") <- 2
attr(OUModelDummy, "regimes") <- letters[1:3]
OUObject <- PCM("OU", k = 2, regimes = letters[1:3])


OUObject2 <- PCM("OU__Omitted_X0__H__Theta__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigma_x__UpperTriangularWithDiagonal_WithNonNegativeDiagonal_Sigmae_x", k = 2, regimes = letters[1:3])

## ------------------------------------------------------------------------
library(data.table)
OUModelDummy <- list()
class(OUModelDummy) <- c("OU")

listParameterizationsOU <- PCMListParameterizations(OUModelDummy)
dtParameterizations <- PCMTableParameterizations(OUModelDummy)

PCMGenerateParameterizations(OUModelDummy, tableParameterizations = dtParameterizations[1:10])

MGObject <- MixedGaussian(k = 2, modelTypes =  PCMModels(), mapping = c(1, 3, 5))

ul <- PCMParamUpperLimit(MGObject)
rv <- PCMParamRandomVecParams(MGObject)
PCMParamGetShortVector(ul)

