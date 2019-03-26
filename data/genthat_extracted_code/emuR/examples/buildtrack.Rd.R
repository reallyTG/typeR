library(emuR)


### Name: buildtrack
### Title: Build trackdata objects from the output of by()
### Aliases: buildtrack
### Keywords: manip

### ** Examples


   #vowlax.fdat is a track data objects of formant of the vowlax segment list
   #calculate the difference between adjacent formant values
   p = by(vowlax.fdat[1,2],INDICES=NULL, diff)
   
   p
   
   
   #now build a track data object out of these values
   m = buildtrack(p)
   
   m




