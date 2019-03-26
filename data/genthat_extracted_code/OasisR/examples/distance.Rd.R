library(OasisR)


### Name: distance
### Title: A function to compute the distance matrix between centroids of
###   spatial units
### Aliases: distance

### ** Examples

 distance(segdata) 

foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'
distance(folder = foldername, shape = shapename)



