library(OasisR)


### Name: Pxy
### Title: A function to compute the mean proximity between persons of
###   different groups (Pxy)
### Aliases: Pxy

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

Pxy(x, spatobj = segdata)

Pxy(x, folder = foldername, shape = shapename, fdist = 'l') 

Pxy(x, spatobj = segdata, diagval ='a')

Pxy(x, d = dist, fdist = 'e')




