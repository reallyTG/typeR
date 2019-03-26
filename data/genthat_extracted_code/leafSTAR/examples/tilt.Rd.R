library(leafSTAR)


### Name: tilt
### Title: Calculate the tilt angle
### Aliases: tilt
### Keywords: 'Ahmes'

### ** Examples

## No test: 
# Data comes from 'Ahmes'
data(olea)
    tilt_olea<-tilt(olea,Ahmes=TRUE)

 # Data comes from other sources
   data(tropical)
    tropi_tilt<-tilt(tropical,pitch=tropical$pitch,roll=tropical$roll,horiz=TRUE)
    tropical2<-cbind(tropical,as.data.frame(tropi_tilt)) 
    # When horiz = TRUE, tilt.raw = tilt!

   data(guava)
    tilt_guava<-tilt(guava,pitch=guava$pitch,roll=guava$roll,horiz=FALSE) 
    # horiz = FALSE
## End(No test)

#tilt()



