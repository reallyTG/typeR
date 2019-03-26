library(OasisR)


### Name: RCL
### Title: A function to compute the relative clustering index (RCL)
### Aliases: RCL

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

RCL(x, spatobj = segdata)

RCL(x, folder = foldername, shape = shapename, fdist = 'l') 

RCL(x, spatobj = segdata, diagval ='a')

RCL(x, d = dist, fdist = 'e')




