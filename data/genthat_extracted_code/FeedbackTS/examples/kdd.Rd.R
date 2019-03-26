library(FeedbackTS)


### Name: kdd
### Title: Build a KDD object from values of slots
### Aliases: kdd
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)
	
#### build a new KDD object by modifying one of the slots of KDD
## (e.g. new starting point of the data series)
KDD2=kdd(before.after=KDD@before.after,date=KDD@date,year=KDD@year,
   day=KDD@day-100,keyday.threshold=KDD@keyday.threshold)

#### simplest alternative
KDD2=KDD
KDD2["day"]=KDD2["day"]-100



