library(emuR)


### Name: dim.trackdata
### Title: A method of the generic function dim for objects of class
###   'trackdata'
### Aliases: dim.trackdata dim
### Keywords: methods

### ** Examples


   #isol.fdat is the formant track of the segment list isol

   #write out the dimension of the track data object 
   dim(isol.fdat)

   #because there are 13 segments
   isol.fdat$ftime

   #and there are 4 rows for each segment (see here for the first segment)
   isol.fdat$data[1,]




