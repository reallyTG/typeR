library(FeedbackTS)


### Name: feedback.test
### Title: Test of feedback and change-in-feedback for a single time series
### Aliases: feedback.test
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008, keyday.threshold=25, nb.days=20,
   col.series=5, col.date=c(2,3,4), na.rm=TRUE, filter=NULL)

#### test feedback and change in feedback with a single data series
## using the thresholded data series
## using difference of means of positive indicator values (i.e. rainfall occurrence)
par(mfrow=c(1,2), mar=c(5.1,4.1,4.1,2.1))
feedback.test(object=KDD, test="feedback", operator="dmpiv", nb.rand=10^3, plots=TRUE)



