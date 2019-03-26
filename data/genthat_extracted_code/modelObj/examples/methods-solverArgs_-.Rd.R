library(modelObj)


### Name: solverArgs<-
### Title: Reset Arguments for Regression Method
### Aliases: solverArgs<- solverArgs<-,modelObj-method

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm')

    solverArgs(mo)
    argList <- list("x"=TRUE)
    solverArgs(mo) <- argList
    solverArgs(mo)



