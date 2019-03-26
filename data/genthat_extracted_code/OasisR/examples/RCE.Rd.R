library(OasisR)


### Name: RCE
### Title: A function to compute Relatice Centralisation Index (RCE)
### Aliases: RCE

### ** Examples

x <- segdata@data[ ,1:2]
distc<- distcenter(segdata, center = 28)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

RCE(x, dc=distc) 

RCE(x, spatobj = segdata, center = 28) 

RCE(x, folder = foldername, shape = shapename, center = 28) 




