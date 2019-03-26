library(YPmodel)


### Name: YPmodel.lackfittest
### Title: Martingale residual-based & contrast-based lack-of-fit tests
### Aliases: YPmodel.lackfittest summary.YPmodel.lackfittest
###   plot.YPmodel.martint plot.YPmodel.survf plot.YPmodel.lackfittest
### Keywords: YPmodel

### ** Examples

    library(YPmodel)
    data(gastric)
    LackFitTest <- YPmodel.lackfittest(data=gastric, repNum=100)
    summary.YPmodel.lackfittest(LackFitTest)
    plot(LackFitTest)

    plot.YPmodel.martint(LackFitTest)
    plot.YPmodel.survf(LackFitTest)



