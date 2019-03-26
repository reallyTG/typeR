library(OasisR)


### Name: ISWong
### Title: A function to compute Wong's segregation index
### Aliases: ISWong

### ** Examples

x <- segdata@data[ ,1:2]
bound <- boundaries(segdata)
per <- perimeter(segdata)
ar <- area(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ISWong(x, b = bound, p = per, a = ar) 

ISWong(x, spatobj = segdata, variant = 's', ptype = 'int')

ISWong(x, folder = foldername, shape = shapename, variant = 'w') 




