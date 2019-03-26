library(OutbreakTools)


### Name: Plot obkData
### Title: Plot outbreak data
### Aliases: plot.obkData plot,obkData-method plot,obkData,ANY-method
### Keywords: multivariate

### ** Examples

data(HorseFlu)
head(HorseFlu)

## default plot: time line
plot(HorseFlu,orderBy='yardID',colorBy='yardID')
plot(HorseFlu,orderBy='yardID',colorBy='yardID',
     selection=1:30) # only the first 30

## plot contacts
data(ToyOutbreak)
plot(ToyOutbreak, "contacts")

## Not run: 
##D ## plot geographic distribution of individuals
##D plot(HorseFlu, "geo", location=c('lon','lat'), colorBy='sex',
##D      zoom=12,center='9')
##D 
##D ## plot minimum spanning tree for first 10 individuals
##D get.nindividuals(HorseFlu)
##D plot(subset(HorseFlu, individuals=1:10), "mst")
## End(Not run)



