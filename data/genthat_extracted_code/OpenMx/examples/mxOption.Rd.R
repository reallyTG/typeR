library(OpenMx)


### Name: mxOption
### Title: Set or Clear an Optimizer Option
### Aliases: mxOption

### ** Examples

# set the Numbder of Threads (cores to use)
mxOption(NULL, "Number of Threads", parallel::detectCores() - 1)

testModel <- mxModel(model = "testModel") # make a model to use for example
testModel$options   # show the model options (none yet)
options()$mxOptions # list all mxOptions (global settings)

testModel <- mxOption(testModel, "Function precision", 1e-5) # set precision
testModel <- mxOption(testModel, "Function precision", NULL) # clear precision
# N.B. This is model-specific precision (defaults to global setting)

# may optimize for speed
# at cost of not getting standard errors
testModel <- mxOption(testModel, "Calculate Hessian", "No")
testModel <- mxOption(testModel, "Standard Errors"  , "No")

testModel$options # see the list of options you set




