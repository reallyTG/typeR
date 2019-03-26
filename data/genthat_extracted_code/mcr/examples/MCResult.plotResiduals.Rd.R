library(mcr)


### Name: MCResult.plotResiduals
### Title: Plot Residuals of an MCResult Object
### Aliases: MCResult.plotResiduals plotResiduals

### ** Examples

data(creatinine,package="mcr")
    x <- creatinine$serum.crea
    y <- creatinine$plasma.crea

    # Deming regression fit.
    # The confidence intercals for regression coefficients
    # are calculated with analytical method
    model <- mcreg( x,y,error.ratio=1,method.reg="WDeming", method.ci="jackknife",
                     mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE )
    plotResiduals(model, res.type="optimized", xaxis="both" )
    plotResiduals(model, res.type="y", xaxis="yhat")



