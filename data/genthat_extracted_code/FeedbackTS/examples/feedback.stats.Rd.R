library(FeedbackTS)


### Name: feedback.stats
### Title: Computation of feedback and change-in-feedback statistics
### Aliases: feedback.stats
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008, keyday.threshold=25, nb.days=20,
   col.series=5, col.date=c(2,3,4), na.rm=TRUE, filter=NULL)
	
#### main feedback statistic
feedback.stats(KDD, "dmv")

#### main and auxiliary feedback statistics
feedback.stats(KDD, "dmv", turning.year=c(1960,1980))

#### apply a trend correction
## define the KDD object used for trend correction (it is defined as
## KDD above except that the threshold value is equal to 0)
KDD2=kdd.from.raw.data(raw.data=rain.site.6008, keyday.threshold=0, nb.days=20,
   col.series=5, col.date=c(2,3,4), na.rm=TRUE, filter=NULL)
## compute the statistic
feedback.stats(KDD, "dmv", trend.correction=list(apply=TRUE, object2=KDD2))



