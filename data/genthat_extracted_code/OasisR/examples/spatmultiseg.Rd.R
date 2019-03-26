library(OasisR)


### Name: spatmultiseg
### Title: A function from seg package to compute spatial multi-group
###   segregation indices
### Aliases: spatmultiseg

### ** Examples

x <- segdata@data[ ,1:2]
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

spatmultiseg(x, spatobj = segdata)

spatmultiseg(x, folder = foldername, shape = shapename) 




