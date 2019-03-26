library(OasisR)


### Name: spatinteract
### Title: A function adapted from seg package to compute spatial
###   exposure/isolation indices
### Aliases: spatinteract

### ** Examples

x <- segdata@data[ ,1:2]
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

spatinteract(x, spatobj = segdata)

spatinteract(x, folder = foldername, shape = shapename) 




