library(modelObj)


### Name: predictorArgs
### Title: Retrieve Arguments Specified for the Prediction Method
### Aliases: predictorArgs predictorArgs,modelObj-method
###   predictorArgs,modelObjFit-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm', 
                        predict.method='predict.lm',
                        predict.args=list(type='response'))

    predictorArgs(mo)




