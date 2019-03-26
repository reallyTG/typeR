library(OasisR)


### Name: Poo
### Title: A function to compute the mean proximity between persons without
###   regard to group (Poo)
### Aliases: Poo

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
dist <- distance(segdata)
diag(dist)<-sqrt(ar) * 0.6
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

Poo(x, spatobj = segdata)

Poo(x, folder = foldername, shape = shapename, fdist = 'l') 

Poo(x, spatobj = segdata, diagval ='a')

Poo(x, d = dist, fdist = 'e') 




