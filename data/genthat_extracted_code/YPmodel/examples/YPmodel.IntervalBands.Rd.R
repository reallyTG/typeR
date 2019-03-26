library(YPmodel)


### Name: YPmodel.IntervalBands
### Title: Beta confidential intervals & bands
### Aliases: YPmodel.IntervalBands summary.YPmodel.IntervalBands
###   plot.YPmodel.IntervalBands
### Keywords: YPmodel

### ** Examples

    library(YPmodel)
    data(gastric)
    IntervalBands <- YPmodel.IntervalBands(data=gastric)
    summary(IntervalBands)
    plot(IntervalBands)

    Estimate <- YPmodel.estimate(data=gastric, interval=0)
    IntervalBands <- YPmodel.IntervalBands(data=gastric, Estimate=Estimate)



