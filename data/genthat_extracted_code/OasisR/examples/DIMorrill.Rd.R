library(OasisR)


### Name: DIMorrill
### Title: A function to compute Morrill's dissimilarity index
### Aliases: DIMorrill

### ** Examples

x <- segdata@data[ ,1:2]
contiguity <- contig(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

DIMorrill(x, c = contiguity) 

DIMorrill(x, spatobj = segdata, queen = FALSE)

DIMorrill(x, folder = foldername, shape = shapename) 



