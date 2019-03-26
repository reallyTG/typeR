library(RMCriteria)


### Name: RPrometheeIII
### Title: RPrometheeIII
### Aliases: RPrometheeIII RPrometheeIII,RPrometheeArguments-method
### Keywords: decision-analysis decision-method mcda promethee

### ** Examples

## Create objects for each argument
data <-matrix(c(5.2, -3.5,
                4.3, -1.2,
                6.7, -2.0), byrow = TRUE, ncol = 2, nrow = 3)

parms <- matrix(c(NA, NA), byrow = TRUE, ncol = 1, nrow = 2)
vecWeights <- c(0.3, 0.7)
vecMaximiz <- c(FALSE, TRUE)
prefFunction <- c(0,0)
alphaVector <- c(1, 2, 1)
normalize <- FALSE
alternatives <- c("Alt 1", "Alt 2", "Alt 3")

## Create RPrometheeArguments object
PromObj <- RPrometheeConstructor(datMat = data, vecWeights = vecWeights,
vecMaximiz = vecMaximiz, prefFunction = prefFunction, parms = parms,
normalize = normalize, alternatives = alternatives, alphaVector = alphaVector)

## Run RPrometheeIII
(result <- RPrometheeIII(PromObj))

## There are two alternatives two plot a RPrometheeIII object:
plot(result)
PrometheeIIIPlot(result)

## Updating alternatives name using UpdateRPrometheeAlternatives
newAlternatives <- c("A", "B", "C")
result <- UpdateRPrometheeAlternatives(result, newAlternatives)

## Updating any argument using UpdateRPrometheeArguments
newAlphaVector <- c(1, 1, 1)
PromObj <- UpdateRPrometheeArguments(PromObj, "alphaVector", newAlphaVector)
result <- RPrometheeIII(PromObj)



