library(OasisR)


### Name: ACEPoly
### Title: A function to compute Massey's Polycentric Absolute
###   Centralisation Index
### Aliases: ACEPoly

### ** Examples

x <- segdata@data[ ,1:2]
ar<-area(segdata)
foldername <- system.file('extdata', package = 'OasisR')
shapename <- 'segdata'

ACEPoly(x, spatobj = segdata, center = c(28, 83) )

ACEPoly(x, folder = foldername, shape = shapename, center = c(28, 83))

center <- c(28, 83)
polydist <- matrix(data = NA, nrow = nrow(x), ncol = length(center))
for (i in 1:ncol(polydist))
  polydist[,i] <- distcenter(spatobj = segdata, center = center[i])
ACEPoly(x, a = ar, dc = polydist)

distmin <- vector(length = nrow(x))
for (i in 1:nrow(polydist)) distmin[i] <- min(polydist[i,])
ACE(x, a = ar, dc = distmin)




