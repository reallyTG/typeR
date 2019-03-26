library(dsm)


### Name: dsm.cor
### Title: Check for autocorrelation in residuals
### Aliases: dsm.cor

### ** Examples

## No test: 
 library(Distance)
 library(dsm)

 # load the data, see ?mexdolphins
 data(mexdolphins)

 # fit a model
 hr.model <- ds(distdata, max(distdata$distance),
                key = "hr", adjustment = NULL)
 mod1<-dsm(count~s(x,y), hr.model, segdata, obsdata)

 # look at lag 1 differences up to a maximum of lag 9, using deviance
 # residuals
 dsm.cor(mod1, resid.type="deviance", max.lag=9,
         Segment.Label="Sample.Label")
## End(No test)



