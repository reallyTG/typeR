library(OasisR)


### Name: ACEDuncan
### Title: A function to compute Duncan's Absolute Centralisation Index
###   (ACEDuncan)
### Aliases: ACEDuncan

### ** Examples

x <- segdata@data[ ,1:2]
distc<- distcenter(segdata, center = 28)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ACEDuncan(x, dc=distc) 

ACEDuncan(x, spatobj = segdata, center = 28) 

ACEDuncan(x, folder = foldername, shape = shapename, center = 28) 




