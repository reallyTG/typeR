library(pgirmess)


### Name: writeGPX
### Title: Convert a data frame into a GPX file of waypoints or track
### Aliases: writeGPX
### Keywords: IO connection

### ** Examples


coords<-data.frame(ID=c("C18J01", "C18J02"),Long= c(-46.996602, 47.002745),
Lat=c(-6.148734, 6.14829),Alt=c(250,1230))

writeGPX(coords) # waypoints
writeGPX(coords,type="t") # track




