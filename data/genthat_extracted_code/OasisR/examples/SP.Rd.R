library(OasisR)


### Name: SP
### Title: A function to compute the spatial proximity index (SP)
### Aliases: SP

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

SP(x, spatobj = segdata)

SP(x, folder = foldername, shape = shapename, fdist = 'l', itype = 'between') 

SP(x, spatobj = segdata, diagval ='a', itype = 'one')

SP(x, d = dist, fdist = 'e')




