library(modelObj)


### Name: buildmodelObj
### Title: Create an Object of Class modelObj
### Aliases: buildModelObj

### ** Examples


    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm', 
                        predict.method='predict.lm',
                        predict.args=list(type='response'))




