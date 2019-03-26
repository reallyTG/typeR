library(FeedbackTS)


### Name: KDD.yearly.average-class
### Title: Class '"KDD.yearly.average"'
### Aliases: KDD.yearly.average-class KDD.yearly.average
###   'KDD.yearly.average class' 'KDD.yearly.average object'
###   KDD.yearly.average-object [,KDD.yearly.average-method
###   show,KDD.yearly.average-method summary,KDD.yearly.average-method
###   names,KDD.yearly.average-method
### Keywords: classes

### ** Examples

showClass("KDD.yearly.average")

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
## names of the object
names(KDD2)
slotNames(KDD2)

## show attributes of the object
KDD2["before.after"][,1:5]
KDD2["year"]
KDD2["keyday.threshold"]



