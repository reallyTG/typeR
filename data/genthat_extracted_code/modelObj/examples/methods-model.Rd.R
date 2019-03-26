library(modelObj)


### Name: model
### Title: Retrieve model Object
### Aliases: model model,modelObj-method model,modelObjXY-method
###   model,modelObjFormula-method model,modelObjFit-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm')


    model(mo)



