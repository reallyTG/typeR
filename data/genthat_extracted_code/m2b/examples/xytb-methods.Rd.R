library(m2b)


### Name: xytb
### Title: xytb class constructor
### Aliases: xytb xytb,missing,missing,ANY,ANY,ANY-method xytb
###   xytb,data.frame,character,ANY,ANY,ANY-method
###   xytb,data.frame,character
###   xytb,data.frame,character,vector,vector,ANY-method
###   xytb,data.frame,character,vector,vector
###   xytb,data.frame,character,vector,vector,vector-method
###   xytb,data.frame,character,vector,vector,vector

### ** Examples

#generate an empty xytb object
xytb()
#generate an xytb object with track information only
#track_CAGA_005 is a dataset
simplexytb<-xytb(track_CAGA_005,"a track")
#generate a complete xytb object with derived (over moving windows of 3, 5
#and 9 points, with quantile at 0, 50 and 100%) and shifted information on 10
#and 100 points
xytb<-xytb(track_CAGA_005,"a track",c(3,5,9),c(0,.5,1),c(10,100))




