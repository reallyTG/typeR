library(OasisR)


### Name: Delta
### Title: A function to compute Delta index
### Aliases: Delta

### ** Examples

x <- segdata@data[ ,1:2]
ar <- area(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

Delta(x, a = ar) 

Delta(x, spatobj = segdata)

Delta(x, folder = foldername, shape = shapename) 



