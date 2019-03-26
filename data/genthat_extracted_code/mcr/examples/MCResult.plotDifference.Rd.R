library(mcr)


### Name: MCResult.plotDifference
### Title: Bland-Altman Plot
### Aliases: MCResult.plotDifference plotDifference

### ** Examples

#library("mcr")
    data(creatinine,package="mcr")
    x <- creatinine$serum.crea
    y <- creatinine$plasma.crea

    # Deming regression fit.
    # The confidence intercals for regression coefficients
    # are calculated with analytical method
    model <- mcreg( x,y,error.ratio=1,method.reg="Deming", method.ci="analytical",
                     mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE )

    plotDifference( model ) # Default plot.type=3
    plotDifference( model, plot.type=5)
    plotDifference( model, plot.type=7, ref.line.lty=3, ref.line.col="green3" )



