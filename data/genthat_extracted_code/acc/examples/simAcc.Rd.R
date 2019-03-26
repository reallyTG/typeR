library(acc)


### Name: simAcc
### Title: Simulates accelerometer data based on a hidden Markov model
### Aliases: simAcc
### Keywords: accelerometer

### ** Examples

## Not run: 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with low activity level.
##D ##
##D mvpaLowData <- simAcc(timelength=(60*24*2),paLevel='low')
##D summary <- acc(data=mvpaLowData, tri='FALSE', axis=NULL,
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary
##D 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with moderate activity level.
##D ##
##D mvpaLowData <- simAcc(timelength=(60*24*2),paLevel='moderate')
##D summary <- acc(data=mvpaLowData, tri='FALSE', axis=NULL,
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary
##D 
##D ##
##D ## Example: Simulate a dataset for two days, for an individual with high activity level.
##D ##
##D mvpaLowData <- simAcc(timelength=(60*24*2),paLevel='high')
##D summary <- acc(data=mvpaLowData, tri='FALSE', axis=NULL,
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary
##D 
## End(Not run)



