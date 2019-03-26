library(mcr)


### Name: MCResultJackknife.plotwithRJIF
### Title: Plotting the Relative Jackknife Influence Function
### Aliases: MCResultJackknife.plotwithRJIF plotwithRJIF

### ** Examples

#library("mcr")
    data(creatinine,package="mcr")
    x <- creatinine$serum.crea
    y <- creatinine$plasma.crea
    # Deming regression fit.
    # The confidence intervals for regression coefficients
    # are calculated with jackknife method
    model <- mcreg( x,y,error.ratio=1,method.reg="Deming", method.ci="jackknife",
                     mref.name = "serum.crea", mtest.name = "plasma.crea", na.rm=TRUE )
    plotwithRJIF(model)



