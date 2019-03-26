library(semtree)


### Name: evaluateDataLikelihood
### Title: Evaluate Data Likelihood
### Aliases: evaluateDataLikelihood
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (model, data, data_type = "raw") 
{
    model <- omxSetParameters(model, labels = names(omxGetParameters(model)), 
        free = F)
    if (data_type == "raw") {
        data <- full_mxdata <- mxData(observed = data, type = "raw")
    }
    else if (data_type == "cov") {
        data <- full_mxdata <- mxData(observed = cov(data), type = "cov", 
            numObs = dim(data)[1])
    }
    else if (data_type == "cor") {
        data <- full_mxdata <- mxData(observed = cor(data), type = "cor", 
            numObs = dim(data)[1])
    }
    else {
        warning("data type is not supported!")
        return(NULL)
    }
    model <- setData(model, data)
    run <- OpenMx::mxRun(model, silent = T, useOptimizer = F, 
        suppressWarnings = T)
    result <- OpenMx::mxEval(objective, run)
    return(result)
  }



