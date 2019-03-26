library(emuR)


### Name: dcut
### Title: Function to extract a vector or matrix from EMU-Trackdata at a
###   single time point of to create another EMU-trackdata object between
###   two times.
### Aliases: dcut dcut.sub
### Keywords: datagen

### ** Examples


     # the data values of the trackdata object at the temporal midpoint
     # (midvals is matrix of F1 and F2 data)
     dip.fdat[1:10]
     midvals <- dcut(dip.fdat, 0.5, prop=TRUE)
     midvals[1:10,]
     
     
     # the data values of the trackdata object between 
     # extending from 20
     # (bet is a trackdata object of F1 and F2 values)
     bet <- dcut(dip.fdat, 0.2, 0.8, prop=TRUE)
     bet[1]
     

     # the data values of the trackdata object at 30 ms after
     # the start time of the trackdata object
     # (time30 is a matrix of F1 and F2 data
     times <- dip.fdat$ftime[,1]+30
     times[1:10]
     time30 <- dcut(dip.fdat, times)
     time30[1:10]
     

     # the data values of the trackdata object 
     # between the  start time and 30 ms after the start  time
     # (int is a trackdata object of F1 and F2 values extending
     # from the start of the diphthongs up to 30 ms after the diphthongs)
     int <- dcut(dip.fdat, dip.fdat$ftime[,1], times)
     int[1]
 



