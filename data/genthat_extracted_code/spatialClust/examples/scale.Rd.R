library(spatialClust)


### Name: scale
### Title: Data Scalling
### Aliases: scale

### ** Examples

#load data
data <- example

#zero to one scalling
data <- scale(data)
data <- scale(data,method="zerotoone")

#z-transform
data <- scale(data,method="z")

#minus one to one scalling
data <- scale(data,method="oneminuseone")




