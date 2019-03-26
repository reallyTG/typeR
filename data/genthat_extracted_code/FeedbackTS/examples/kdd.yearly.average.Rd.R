library(FeedbackTS)


### Name: kdd.yearly.average
### Title: Build a KDD.yearly.average object from a KDD object
### Aliases: kdd.yearly.average
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build a KDD object from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)

#### build the yearly average of KDD
KDD2=kdd.yearly.average(KDD)

## summary of the object
summary(KDD2)



