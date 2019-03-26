library(acc)


### Name: accBatch
### Title: Summarizes multiple accelerometer datafiles
### Aliases: accBatch
### Keywords: accelerometer

### ** Examples

##
## Example
##
## Not run: 
##D mypath <- "C:/Accelerometry files/readfiles"
##D accBatch(path=mypath, tri='TRUE', axis='vm',
##D                      spuriousDef=20, nonwearDef=60, minWear=600, 
##D                      patype=c('Sedentary','MVPA'),pacut=c(c(0,99),c(1952,Inf)), 
##D                      boutsize=c(10,10), tolerance=c('FALSE','TRUE'))
## End(Not run)



