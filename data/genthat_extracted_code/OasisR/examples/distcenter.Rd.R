library(OasisR)


### Name: distcenter
### Title: A function to compute the distance from spatial units centroids
###   to the center
### Aliases: distcenter

### ** Examples

 distcenter(segdata, center = 46) 
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'
distcenter(folder = foldername, shape = shapename, center = 19)



