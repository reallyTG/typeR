library(RMCriteria)
datMat <- matrix(c(5.2, -3.5,
                   4.3, -1.2,
                   6.7, -2.0), byrow = TRUE, ncol = 2, nrow = 3)

parms <- matrix(c(NA, NA), byrow = TRUE, ncol = 1, nrow = 2)
vecWeights <- c(0.3, 0.7)
vecMaximiz <- c(FALSE, TRUE)
prefFunction <- c(0, 0)
normalize <- FALSE
alphaVector <- c(1, 2, 1)

PromObj <- RPrometheeConstructor(datMat = datMat, vecWeights = vecWeights, vecMaximiz = vecMaximiz, prefFunction = prefFunction, parms = parms, normalize = normalize, alphaVector = alphaVector)

res <- RPrometheeIII(PromObj)
summary(res)
print(res)
show(res)
str(res)

PrometheeIIIPlot(res)
plot(res)

alt <- c("A", "B", "C")

res <- UpdateRPrometheeAlternatives(res, alt)

newAlphaVector <- c(1, 1, 1)
newValue <- c(1, 1, 1)
element <- "alphaVector"

PromObj <- UpdateRPrometheeArguments(PromObj, "alphaVector", newAlphaVector)

str(PromObj)
