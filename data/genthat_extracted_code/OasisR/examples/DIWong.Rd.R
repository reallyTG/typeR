library(OasisR)


### Name: DIWong
### Title: A function to compute Wongs's dissimilarity index
### Aliases: DIWong

### ** Examples

x <- segdata@data[ ,1:2]
bound <- boundaries(segdata)
per <- perimeter(segdata)
ar <- area(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

DIWong(x, b = bound, p = per, a = ar) 

DIWong(x, spatobj = segdata, variant = 'w') 

DIWong(x, folder = foldername, shape = shapename, ptype ='all') 



