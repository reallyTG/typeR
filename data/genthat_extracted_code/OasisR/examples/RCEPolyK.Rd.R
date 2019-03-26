library(OasisR)


### Name: RCEPolyK
### Title: A function to compute Constrained Relative Centralisation Index
### Aliases: RCEPolyK

### ** Examples

x <- segdata@data[ ,1:2]
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

RCEPolyK(x, spatobj = segdata, center = c(28, 83))

RCEPolyK(x, folder = foldername, shape = shapename, center = c(28, 83), K = 3)

center <- c(28, 83)
polydist <- matrix(data = NA, nrow = nrow(x), ncol = length(center))
for (i in 1:ncol(polydist))
  polydist[,i] <- distcenter(spatobj = segdata, center = center[i])
RCEPolyK(x, dc = polydist, kdist = 2)




