library(imager)


### Name: imager.subset
### Title: Array subset operator for cimg objects
### Aliases: imager.subset

### ** Examples

im <- imfill(4,4)
dim(im) #4 dimensional, but the last two ones are singletons
im[,1,,] <- 1:4 #Assignment the standard way
im[,1] <- 1:4 #Shortcut
as.matrix(im)
im[1:2,]
dim(boats)
#Arguments will be recycled, as in normal array operations
boats[1:2,1:3,] <- imnoise(2,3) #The same noise array is replicated over the three channels



