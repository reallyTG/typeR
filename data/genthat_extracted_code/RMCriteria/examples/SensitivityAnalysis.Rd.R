library(RMCriteria)


### Name: SensitivityAnalysis
### Title: SensitivityAnalysis
### Aliases: SensitivityAnalysis
###   SensitivityAnalysis,RPrometheeArguments-method
### Keywords: decision-analysis decision-method mcda promethee

### ** Examples

## Create objects for each argument
data <- matrix(c(5.2, -3.5,
                 4.3, -1.2,
                 6.7, -2.0,
                 5.4, -5.0,
                 4.8,  0.0,
                 2.8, -3.4), byrow = TRUE, ncol = 2)

parms<-matrix(c(1.0, -2.3), byrow = TRUE, ncol = 1, nrow = 2)
vecWeights <- c(0.3, 0.7)
vecMaximiz <- c(FALSE, TRUE)
prefFunction <- c(0, 0)
constraintDir <- rep("<=", ncol(data))
bounds <- c(7,-1)
normalize <- FALSE
alternatives <- c("Alt 1", "Alt 2", "Alt 3")

## Create RPrometheeArguments object
PromObj <- RPrometheeConstructor(datMat = data, vecWeights = vecWeights,
vecMaximiz = vecMaximiz, prefFunction = prefFunction, parms = parms,
normalize = normalize, alternatives = alternatives, bounds = bounds,
constraintDir = constraintDir)

## Run RPrometheeV using standard method ("RPrometheeII")
(result <- SensitivityAnalysis(PromObj))

## Run RPrometheeV using RPrometheeIV
(result <- SensitivityAnalysis(PromObj, "RPrometheeIV"))

## Updating alternatives name using UpdateRPrometheeAlternatives
newAlternatives <- c("A", "B", "C", "D", "E", "F")
result <- UpdateRPrometheeAlternatives(result, newAlternatives)

## Updating any argument using UpdateRPrometheeArguments
newParms <- matrix(c(1.6, 4.2), byrow = TRUE, ncol = 1)
PromObj <- UpdateRPrometheeArguments(PromObj, "parms", newParms)
(result <- SensitivityAnalysis(PromObj))



