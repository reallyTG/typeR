library(climatol)


### Name: daily2climatol
### Title: Convert daily data files to Climatol input format
### Aliases: daily2climatol

### ** Examples

wd <- tempdir() #temporal working directory for the examples
wd0 <- setwd(wd)
data(dailies)
write.table(stations,'stations.txt',sep=',',row.names=FALSE,col.names=FALSE)
write.table(WY003,'WY003.txt',sep=',',row.names=FALSE,col.names=FALSE)
write.table(WY018,'WY018.txt',sep=',',row.names=FALSE,col.names=FALSE)
write.table(WY020,'WY020.txt',sep=',',row.names=FALSE,col.names=FALSE)
daily2climatol('stations.txt',c(1,3,2,4,0,0),2:5,'TestVar',sep=',',na.strings='-99.9')
#Return to user's working directory:
setwd(wd0)
#Input and output files can be found in directory:
print(wd)



