library(OasisR)


### Name: ISMorrillK
### Title: A function to compute K-th order Morrill's segregation index
### Aliases: ISMorrillK

### ** Examples

x <- segdata@data[ ,1:2]
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ISMorrillK(x, spatobj = segdata, queen = FALSE, K = 3)

ISMorrillK(x, folder = foldername, shape = shapename, K = 4, f = 'rec') 




