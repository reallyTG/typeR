library(modelObj)


### Name: solverArgs
### Title: Retrieve Arguments for Regression Method.
### Aliases: solverArgs solverArgs,modelObj-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model = Y ~ X1 + X2 + X3 + X4,
                   solver.method = 'lm', 
                   predict.method = 'predict.lm',
                   predict.args = list(type='response'))

    solverArgs(mo)
    solverArgs(mo) <- list(model=TRUE)
    solverArgs(mo)




