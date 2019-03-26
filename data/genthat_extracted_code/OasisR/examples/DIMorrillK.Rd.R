library(OasisR)


### Name: DIMorrillK
### Title: A function to compute K-th order Morrill's dissimilarity index
### Aliases: DIMorrillK

### ** Examples

x <- segdata@data[ ,1:2]
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

DIMorrillK(x, spatobj = segdata, queen = FALSE, K = 3)

DIMorrillK(x, folder = foldername, shape = shapename, K = 4, f = 'rec') 



