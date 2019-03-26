library(emuR)


### Name: dplot
### Title: A function to plot one or more columns of EMU-trackdata as a
###   function of time
### Aliases: dplot dplot.norm dplot.time
### Keywords: dplot

### ** Examples



   # Plot of column 1 (which happens to be the 1st formant) of an EMU-trackdata object
   dplot(dip.fdat[,1])
	

   # As above but only observations 1 to 5
   dplot(dip.fdat[1:5,1])
	

   #  column 2 (which happens to be of the second formant) and colour-coded
   # for each label-type
   dplot(dip.fdat[,2], dip.l)
	

   # put the legend bottom left
   dplot(dip.fdat[,2], dip.l, legend="bottomleft")
	

   # as above with no legend and averaged per category
   dplot(dip.fdat[,2], dip.l, legend=FALSE, average=TRUE)
	

   # both formants averaged
   dplot(dip.fdat[,1:2], dip.l, average=TRUE)
	

   # F2 only with linear-time normalisation
   dplot(dip.fdat[,2], dip.l, norm=TRUE)
	

   # linear time-normalisation, both formants and averaged
   dplot(dip.fdat[,1:2], dip.l, norm=TRUE, average=TRUE)
	

   # synchronise at the temporal midpoint before averaging, F2 only
   dplot(dip.fdat[,2], dip.l, offset=0.5, average=TRUE)
	

   # synchronise 60 ms before the diphthong offset
   dplot(dip.fdat[,2], dip.l, offset=dip.fdat$ftime[,2]-60, prop=FALSE)
	

   # as above averaged, no colour with linetype, 
# different plot symbols double line thickness in the range between +- 20 ms
   dplot(dip.fdat[,2], dip.l, offset=dip.fdat$ftime[,2]-60, prop=FALSE,
   average=TRUE, colour=FALSE, lty=TRUE, pch=1:3, lwd =2, type="b", xlim=c(-20, 20))







