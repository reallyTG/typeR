library(warbleR)


### Name: filtersels
### Title: Subset selection data frames based on manually filtered image
###   files
### Aliases: filtersels

### ** Examples

## Not run: 
##D  
##D # First set temporary folder
##D # setwd(tempdir())
##D 
##D # save wav file examples
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D 
##D specreator(selec.table, flim = c(0, 11), inner.mar = c(4,4.5,2,1), outer.mar = c(4,2,2,1), 
##D picsize = 2, res = 300, cexlab = 2, mar = 0.05, wl = 300)
##D 
##D #go to the working directory and delete some images
##D 
##D #filter selection data frame
##D fmloc <- filtersels(X = selec.table)
##D 
##D #this data frame does not have the selections corresponding to the images that were deleted
##D fmloc
##D 
##D #now using lspec images
##D lspec(sxrow = 2, rows = 8, pal = reverse.heat.colors, wl = 300, ovlp = 10)
##D 
##D #go to the working directory and delete lspec images (the ones with several rows of spectrograms)
##D 
##D #filter selection data frame
##D 
## End(Not run)




