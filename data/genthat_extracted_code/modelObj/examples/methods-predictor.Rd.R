library(modelObj)


### Name: predictor
### Title: Retrieve Prediction Method
### Aliases: predictor predictor,modelObj-method
###   predictor,modelObjFit-method show,modelObjFit-method
###   summary,modelObjFit-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm', 
                        predict.method='predict.lm',
                        predict.args=list(type='response'))

    predictor(mo)




