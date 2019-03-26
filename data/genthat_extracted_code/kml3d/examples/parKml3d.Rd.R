library(kml3d)


### Name: parKml3d
### Title: ~ Function: parKml3d ~
### Aliases: parKml3d

### ** Examples

### Generation of some data
cld1 <- generateArtificialLongData3d(c(15,15,15))

### Setting two different set of option :
(option1 <- parKml3d())
(option2 <- parKml3d(centerMethod=function(x)median(x,na.rm=TRUE)))

### Running kml. Formaly, the second exemple is 'k-median'
kml3d(cld1,4,1,toPlot="both",parAlgo=option1)
kml3d(cld1,4,1,toPlot="both",parAlgo=option2)



