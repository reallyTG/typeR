library(mcr)


### Name: MCResult.calcBias
### Title: Systematical Bias Between Reference Method and Test Method
### Aliases: MCResult.calcBias calcBias

### ** Examples

#library("mcr")
    data(creatinine,package="mcr")
    x <- creatinine$serum.crea
    y <- creatinine$plasma.crea

    # Deming regression fit.
    # The confidence intervals for regression coefficients
    # are calculated with analytical method
    model <- mcreg( x,y,error.ratio = 1,method.reg = "Deming", method.ci = "analytical",

                     mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE )
    # Now we calculate the systematical bias
    # between the testmethod and the reference method
    # at the medical decision points 1, 2 and 3

    calcBias( model, x.levels = c(1,2,3))
    calcBias( model, x.levels = c(1,2,3), type = "proportional")
    calcBias( model, x.levels = c(1,2,3), type = "proportional", percent = FALSE)



