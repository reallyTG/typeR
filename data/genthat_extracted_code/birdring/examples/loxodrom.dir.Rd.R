library(birdring)


### Name: loxodrom
### Title: loxodromic distance and direction
### Aliases: loxodrom.dir loxodrom.dist
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

loxodrom.dist(rxdec, rydec, fxdec, fydec) 

loxodrom.dir(rxdec, rydec, fxdec, fydec)  



