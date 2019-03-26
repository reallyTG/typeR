library(kml)


### Name: parKml
### Title: ~ Function: parKml ~
### Aliases: parKml parALGO [<-,ParKml,ANY,ANY,ANY-method
###   [,ParKml,ANY,ANY-method

### ** Examples

## No test: 
### Generation of some data
cld1 <- generateArtificialLongData()

### Setting two different set of option :
(option1 <- parALGO())
(option2 <- parALGO(distanceName="maximum",centerMethod=function(x)median(x,na.rm=TRUE)))

### Running kml We suspect 3, 4 or 5 clusters, we want 3 redrawing.
kml(cld1,3:5,3,toPlot="both",parAlgo=option1)
kml(cld1,3:5,3,toPlot="both",parAlgo=option2)
## End(No test)



