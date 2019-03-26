library(FeedbackTS)


### Name: rain.site.6008
### Title: Rainfall data at Callagiddy station
### Aliases: rain.site.6008
### Keywords: datasets

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD object from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 0 to keep all days
KDDno=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=0,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)

#### compute after-before differences and plot the whole data series
plot(KDDno["day"],KDDno["before.after"][21,],type="l",xlab="Day",ylab="Daily rainfall")
   axis(3,at=c(1,365*30,365*60,365*90),labels=KDDno["year"][1]+c(0,30,60,90))



