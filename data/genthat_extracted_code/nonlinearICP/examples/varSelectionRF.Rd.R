library(nonlinearICP)


### Name: varSelectionRF
### Title: Variable selection function that can be provided to
###   'nonlinearICP' - it is then applied to pre-select a set of variables
###   before running the ICP procedure on this subset. Here, the variable
###   selection is based on random forest variable importance measures.
### Aliases: varSelectionRF

### ** Examples

# Example 1
require(CondIndTests)
data("simData")
targetVar <- 2
# choose environments where we did not intervene on var
useEnvs <- which(simData$interventionVar[,targetVar] == 0)
ind <- is.element(simData$environment, useEnvs)
X <- simData$X[ind,-targetVar]
Y <- simData$X[ind,targetVar]
E <- as.factor(simData$environment[ind])
chosenIdx <- varSelectionRF(X = X, Y = Y, env = E, verbose = TRUE)
cat(paste("Variable(s)", paste(chosenIdx, collapse=", "), "was/were chosen."))



