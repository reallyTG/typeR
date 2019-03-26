library(OasisR)


### Name: Pxx
### Title: A function to compute the mean proximity between members of a
###   group (Pxx)
### Aliases: Pxx

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

Pxx(x, spatobj = segdata)

Pxx(x, folder = foldername, shape = shapename, fdist = 'l') 

Pxx(x, spatobj = segdata, diagval ='a')

Pxx(x, d = dist, fdist = 'e')




