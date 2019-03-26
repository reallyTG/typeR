library(adehabitatHR)


### Name: getverticeshr
### Title: Extract the home-range contour of one or several animals
### Aliases: getverticeshr getverticeshr.estUD getverticeshr.estUDm
###   getverticeshr.MCHu getverticeshr.default
### Keywords: spatial

### ** Examples


### Example with a kernel home range
data(puechabonsp)
loc <- puechabonsp$relocs
     
## have a look at the data
head(as.data.frame(loc))
## the first column of this data frame is the ID
     
## Estimation of UD for the four animals
(ud <- kernelUD(loc[,1]))

## Calculates the home range contour

ver <- getverticeshr(ud, percent=95)
ver
plot(ver)

## Example with a cluster home range
clu <- clusthr(loc[,1])
ver2 <- getverticeshr(clu, percent=95)
ver2
plot(ver2)




