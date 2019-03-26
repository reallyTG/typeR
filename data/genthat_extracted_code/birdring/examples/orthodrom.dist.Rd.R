library(birdring)


### Name: orthodrom.dist
### Title: orthodromic distance and direction
### Aliases: orthodrom.dist
### Keywords: math misc spatial

### ** Examples


ringingx<-7.30
ringingy<-47.41
findingx<-5.1
findingy<-32.01
rxdec<-decimal.coord(ringingx)
rydec<-decimal.coord(ringingy)
fxdec<-decimal.coord(findingx)
fydec<-decimal.coord(findingy)     

orthodrom.dist(rxdec, rydec, fxdec, fydec) 



