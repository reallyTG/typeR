library(OpenMx)


### Name: omxCheckWarning
### Title: Correct Warning Message Function
### Aliases: omxCheckWarning

### ** Examples

msg <- paste("Objective functions like mxFIMLObjective()",
	"have been deprecated in favor of expectation and fit functions.\n",
	"Please use mxExpectationNormal(covariance= , means = , ...) instead,",
	"and add a call to mxFitFunctionML().",
	"See examples at help(mxExpectationNormal)")
foo <- omxCheckWarning(mxFIMLObjective('cov', 'mean'), msg)



