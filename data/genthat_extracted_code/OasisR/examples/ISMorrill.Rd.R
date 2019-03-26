library(OasisR)


### Name: ISMorrill
### Title: A function to compute Morrill's segregation index
### Aliases: ISMorrill

### ** Examples

x <- segdata@data[ ,1:2]
contiguity <- contig(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ISMorrill(x, c = contiguity) 

ISMorrill(x, spatobj = segdata)

ISMorrill(x, folder = foldername, shape = shapename) 




