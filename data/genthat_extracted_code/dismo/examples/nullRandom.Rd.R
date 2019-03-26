library(dismo)


### Name: Random null model
### Title: Random null model
### Aliases: nullRandom
### Keywords: spatial

### ** Examples

predictors <- stack(list.files(path=paste(system.file(package="dismo"), '/ex', sep=''), 
               pattern='grd', full.names=TRUE ))
occurence <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
occ <- read.table(occurence, header=TRUE, sep=',')[,-1]
 
x <- extract(predictors, occ)
nr <- nullRandom(x, bioclim, n=25, rep=25, pa=FALSE)
mean(sapply(nr, function(x)x@auc))



