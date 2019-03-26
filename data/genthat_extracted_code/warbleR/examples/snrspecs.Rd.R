library(warbleR)


### Name: snrspecs
### Title: Spectrograms with background noise margins
### Aliases: snrspecs

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D  
##D data(list = c("Phae.long1", "Phae.long2", "selec.table"))
##D writeWave(Phae.long1, "Phae.long1.wav") #save sound.files
##D writeWave(Phae.long2, "Phae.long2.wav") 
##D 
##D # make Phae.long1 and Phae.long2 spectrograms
##D # snrmar needs to be smaller before moving on to sig2noise()
##D 
##D snrspecs(selec.table, flim = c(0, 14), inner.mar = c(4,4.5,2,1), outer.mar = c(4,2,2,1), 
##D picsize = 2, res = 300, cexlab = 2, mar = 0.2, snrmar = 0.1, it = "jpeg", wl = 300)
##D 
##D # make only Phae.long1 spectrograms
##D # snrmar now doesn't overlap neighboring signals
##D 
##D snrspecs(selec.table[grepl(c("Phae.long1"), selec.table$sound.files), ], flim = c(3, 14),
##D inner.mar = c(4,4.5,2,1), outer.mar = c(4,2,2,1), picsize = 2, res = 300, cexlab = 2,
##D mar = 0.2, snrmar = 0.01, wl = 300)
##D 
##D #check this folder!!
##D getwd()
## End(Not run)



