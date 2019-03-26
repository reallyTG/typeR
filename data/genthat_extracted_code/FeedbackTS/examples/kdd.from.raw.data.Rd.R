library(FeedbackTS)


### Name: kdd.from.raw.data
### Title: Build a KDD object from raw data
### Aliases: kdd.from.raw.data
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)
summary(KDD)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
## using filters
rain.site.6008b=cbind(rain.site.6008,rain.site.6008[["Year"]]>=1960)
KDD2=kdd.from.raw.data(raw.data=rain.site.6008b,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,
   filter=list(list(apply.over="range",column=6,value=TRUE)))
summary(KDD2)



