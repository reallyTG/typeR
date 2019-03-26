library(secr)


### Name: traps.info
### Title: Detector Attributes
### Aliases: searcharea polyID polyID<- transectID transectID<-
###   transectlength
### Keywords: manip

### ** Examples


## default is a single polygon
temp <- make.grid(detector = "polygon", hollow = TRUE)
polyID(temp)
plot(temp)

## split in two
temp <- make.grid(detector = "polygon", hollow = TRUE)
polyID(temp) <- factor(rep(c(1,2),rep(10,2)))
plot(temp)
 



