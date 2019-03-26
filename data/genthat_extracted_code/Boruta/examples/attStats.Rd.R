library(Boruta)


### Name: attStats
### Title: Extract attribute statistics
### Aliases: attStats

### ** Examples

## Not run: 
##D library(mlbench); data(Sonar)
##D #Takes some time, so be patient
##D Boruta(Class~.,data=Sonar,doTrace=2)->Bor.son
##D print(Bor.son)
##D stats<-attStats(Bor.son)
##D print(stats)
##D plot(normHits~meanImp,col=stats$decision,data=stats)
## End(Not run)



