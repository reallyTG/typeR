library(YPmodel)


### Name: YPmodel.adlgrk
### Title: Adaptively weighted logrank test
### Aliases: YPmodel.adlgrk summary.YPmodel.adlgrk
### Keywords: YPmodel

### ** Examples

    library(YPmodel)
    data(gastric)
    Adlgrk <- YPmodel.adlgrk(data=gastric)
    summary(Adlgrk)

    Estimate <- YPmodel.estimate(data=gastric, interval=0)
    Adlgrk <- YPmodel.adlgrk(data=gastric, Estimate=Estimate)



