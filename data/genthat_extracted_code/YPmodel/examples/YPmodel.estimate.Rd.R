library(YPmodel)


### Name: YPmodel.estimate
### Title: YPmodel Estimate Parameters.
### Aliases: YPmodel.estimate summary.YPmodel.estimate
###   plot.YPmodel.survivor plot.YPmodel.estimate
### Keywords: YPmodel

### ** Examples

    library(YPmodel)
    data(gastric)
    Estimate <- YPmodel.estimate(data=gastric, interval=1)

    Estimate <- YPmodel.estimate(data=gastric, startPoint=c(0,0), nm=log(100))

    Estimate <- YPmodel.estimate(data=gastric, maxIter1=50, maxIter2=20)

    summary(Estimate)

    plot(Estimate)



