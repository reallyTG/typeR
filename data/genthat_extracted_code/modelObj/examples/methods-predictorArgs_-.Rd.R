library(modelObj)


### Name: predictorArgs<-
### Title: Reset Arguments for Prediction Method
### Aliases: predictorArgs<- predictorArgs<--methods
###   predictorArgs<-,modelObj-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm', 
                        predict.method='predict.lm',
                        predict.args=list(type='response'))

    predictorArgs(mo)
    argList <- list("type"='terms')
    predictorArgs(mo) <- argList
    predictorArgs(mo)



