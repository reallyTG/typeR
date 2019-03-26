library(LS2W)


### Name: packetj
### Title: Converts an imwd object to a wst2D object at a given level.
### Aliases: packetj
### Keywords: classes

### ** Examples


#Obtain an imwd object
#
testimage <- HaarMontage(256, "diagonal")
testimageIMWD<- imwd(testimage, type="station")
#
#Specify our weaving permutation
#
arrvec <- getarrvec(9, sort=FALSE)
#
#Convert level 6 coefficients into packet ordered object
#
o <- arrvec[,2]
packmat <- packetj(testimageIMWD, 6, o)
#



