library(Boruta)


### Name: Boruta
### Title: Feature selection with the Boruta algorithm
### Aliases: Boruta Boruta.default Boruta.formula

### ** Examples

set.seed(777)
#Add some nonsense attributes to iris dataset by shuffling original attributes
iris.extended<-data.frame(iris,apply(iris[,-5],2,sample))
names(iris.extended)[6:9]<-paste("Nonsense",1:4,sep="")
#Run Boruta on this data
Boruta(Species~.,data=iris.extended,doTrace=2)->Boruta.iris.extended
#Nonsense attributes should be rejected
print(Boruta.iris.extended)

#Boruta using rFerns' importance
Boruta(Species~.,data=iris.extended,getImp=getImpFerns)->Boruta.ferns.irisE
print(Boruta.ferns.irisE)

## Not run: 
##D #Boruta on the HouseVotes84 data from mlbench
##D library(mlbench); data(HouseVotes84)
##D na.omit(HouseVotes84)->hvo
##D #Takes some time, so be patient
##D Boruta(Class~.,data=hvo,doTrace=2)->Bor.hvo
##D print(Bor.hvo)
##D plot(Bor.hvo)
##D plotImpHistory(Bor.hvo)
## End(Not run)
## Not run: 
##D #Boruta on the Ozone data from mlbench
##D library(mlbench); data(Ozone)
##D library(randomForest)
##D na.omit(Ozone)->ozo
##D Boruta(V4~.,data=ozo,doTrace=2)->Bor.ozo
##D cat('Random forest run on all attributes:\n')
##D print(randomForest(V4~.,data=ozo))
##D cat('Random forest run only on confirmed attributes:\n')
##D print(randomForest(ozo[,getSelectedAttributes(Bor.ozo)],ozo$V4))
## End(Not run)
## Not run: 
##D #Boruta on the Sonar data from mlbench
##D library(mlbench); data(Sonar)
##D #Takes some time, so be patient
##D Boruta(Class~.,data=Sonar,doTrace=2)->Bor.son
##D print(Bor.son)
##D #Shows important bands
##D plot(Bor.son,sort=FALSE)
## End(Not run)



