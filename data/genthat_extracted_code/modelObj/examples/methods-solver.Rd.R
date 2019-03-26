library(modelObj)


### Name: solver
### Title: Retrieve Regression Method.
### Aliases: solver,modelObj-method solver

### ** Examples

    #----------------------------------------------------#
    # Create modeling object using a formula
    #----------------------------------------------------#
    mo <- buildModelObj(model=Y ~ X1 + X2 + X3 + X4,
                        solver.method='lm')

    solver(mo)




