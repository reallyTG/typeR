library(warbleR)


### Name: lspec
### Title: Create long spectrograms of whole sound files
### Aliases: lspec

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D # save sound file examples
##D data(list = c("Phae.long1", "Phae.long2","selec.table"))
##D writeWave(Phae.long1,"Phae.long1.wav") 
##D writeWave(Phae.long2,"Phae.long2.wav")
##D 
##D lspec(sxrow = 2, rows = 8, pal = reverse.heat.colors, wl = 300)
##D 
##D # including selections
##D lspec(sxrow = 2, rows = 8, X = selec.table, pal = reverse.heat.colors, redo = TRUE, wl = 300)
##D 
##D #check this floder
##D getwd()
## End(Not run)




