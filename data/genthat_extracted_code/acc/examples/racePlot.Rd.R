library(acc)


### Name: racePlot
### Title: Race plots of minutes of activity per day
### Aliases: racePlot
### Keywords: accelerometer

### ** Examples

## Not run: 
##D library(acc)
##D ##
##D ## Example: Simulate a dataset for seven days, for an individual with low MVPA level.
##D ##
##D mvpaModData <- simAcc(timelength=(60*24*7),paLevel='moderate')
##D 
##D summary1 <- acc(data=mvpaModData, tri='FALSE', axis='NULL',
##D spuriousDef=20, nonwearDef=60, minWear=600,epoch=c('1 min','1 min'),
##D patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)),
##D boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
##D summary1
##D 
##D racePlot(summary1,title="Summary of Physical Activity Per Day",
##D cex.title=1,cex.text=1.2)
## End(Not run)



