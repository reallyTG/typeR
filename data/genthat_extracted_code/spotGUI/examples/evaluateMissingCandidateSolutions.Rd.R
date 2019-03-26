library(spotGUI)


### Name: evaluateMissingCandidateSolutions
### Title: evaluateMissingCandidateSolutions
### Aliases: evaluateMissingCandidateSolutions

### ** Examples

library(SPOT)
spotData <- NULL
#Generating DOE
spotData$x <- designLHD(x = NULL, lower = c(-5, -5), upper = c(5, 5),
                        control = list(size = 10,
                             types = c("numeric", "numeric")))

#Evaluating Candidate Solutions
spotData$y <- evaluateMissingCandidateSolutions(
        currX = spotData$x, currY = spotData$y, fun = funSphere)

#Build model on evaluated data
spotData$modelFit <- buildKriging(as.matrix(spotData$x),as.matrix(spotData$y))




