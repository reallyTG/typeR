library(Boruta)


### Name: getImpLegacyRf
### Title: randomForest importance adapters
### Aliases: getImpLegacyRf getImpLegacyRfZ getImpLegacyRfGini
###   getLegacyImpRfRaw getImpLegacyRfRaw

### ** Examples

set.seed(777)
#Add some nonsense attributes to iris dataset by shuffling original attributes
iris.extended<-data.frame(iris,apply(iris[,-5],2,sample))
names(iris.extended)[6:9]<-paste("Nonsense",1:4,sep="")
#Run Boruta on this data
Boruta(Species~.,getImp=getImpLegacyRfZ,
 data=iris.extended,doTrace=2)->Boruta.iris.extended
#Nonsense attributes should be rejected
print(Boruta.iris.extended)



