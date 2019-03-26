library(OasisR)


### Name: DPxy
### Title: A function to compute the distance-decay interaction index
###   (DPxy)
### Aliases: DPxy

### ** Examples

x <- segdata@data[ ,1:2]
ar <- area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

DPxy(x, d = dist)

DPxy(x, spatobj = segdata, diagval = 'a')

DPxy(x, folder = foldername, shape = shapename, diagval = '0') 



