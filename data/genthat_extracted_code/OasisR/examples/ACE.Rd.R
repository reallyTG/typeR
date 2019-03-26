library(OasisR)


### Name: ACE
### Title: A function to compute Massey Absolute Centralisation Index (ACE)
### Aliases: ACE

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
distc<- distcenter(segdata, center = 28)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ACE(x, a = ar, dc=distc) 

ACE(x, spatobj = segdata, center = 28) 

ACE(x, folder = foldername, shape = shapename, center = 28) 




