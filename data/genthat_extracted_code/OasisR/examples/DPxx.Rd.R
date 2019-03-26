library(OasisR)


### Name: DPxx
### Title: A function to compute the distance-decay isolation index (DPxx)
### Aliases: DPxx

### ** Examples

x <- segdata@data[ ,1:2]
ar <- area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

DPxx(x, d = dist)

DPxx(x, spatobj = segdata, diagval = 'a')

DPxx(x, folder = foldername, shape = shapename, diagval = '0') 



