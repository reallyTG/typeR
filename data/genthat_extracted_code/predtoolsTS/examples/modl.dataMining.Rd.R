library(predtoolsTS)


### Name: modl.dataMining
### Title: Train the data
### Aliases: modl.dataMining

### ** Examples

## No test: 
modl.dataMining(form=Class ~ .,
 tserieDF=modl.tsToDataFrame(AirPassengers,formula=c(1:20)),
 algorithm='rpart',
 timeControl=modl.trControl(initialWindow=30,horizon=15,fixedWindow=TRUE))
## End(No test)



