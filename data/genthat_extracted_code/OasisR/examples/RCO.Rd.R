library(OasisR)


### Name: RCO
### Title: A function to compute Relative Concentration index (RCO)
### Aliases: RCO

### ** Examples

x <- GreHSize@data[ ,3:5]
ar <- area(GreHSize)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'GreHSize'

RCO(x, a = ar) 

RCO(x, spatobj = GreHSize)

RCO(x, folder = foldername, shape = shapename) 




