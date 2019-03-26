library(FeedbackTS)


### Name: KDD-class
### Title: Class '"KDD"'
### Aliases: KDD-class KDD 'KDD object' KDD-object 'KDD class'
###   [<-,KDD-method [,KDD-method names,KDD-method show,KDD-method
###   summary,KDD-method
### Keywords: classes

### ** Examples

showClass("KDD")

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build a KDD object from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)

## summary of the object
summary(KDD)
## names of the object
names(KDD)
slotNames(KDD)

## show attributes of the object
KDD["before.after"][,1:5]
KDD["date"]
KDD["keyday.threshold"]

## change keyday threshold
KDD["keyday.threshold"]=50



