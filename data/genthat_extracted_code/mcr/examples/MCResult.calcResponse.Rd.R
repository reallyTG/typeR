library(mcr)


### Name: MCResult.calcResponse
### Title: Calculate Response with Confidence Interval.
### Aliases: MCResult.calcResponse calcResponse

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
    calcResponse(model, x.levels=c(1,2,3))



