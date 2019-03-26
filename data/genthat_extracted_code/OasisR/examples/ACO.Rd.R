library(OasisR)


### Name: ACO
### Title: A function to compute Absolute Concentration index (ACO)
### Aliases: ACO

### ** Examples

x <- GreHSize@data[ ,3:5]
ar <- area(GreHSize)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'GreHSize'

ACO(x, a = ar) 

ACO(x, spatobj = GreHSize)

ACO(x, folder = foldername, shape = shapename) 




