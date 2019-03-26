library(warbleR)


### Name: lspec2pdf
### Title: 'lspec2pdf' combines 'lspec' images in .jpeg format to a single
###   pdf file.
### Aliases: lspec2pdf

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D # save sound file examples
##D data(list = c("Phae.long1", "Phae.long2"))
##D writeWave(Phae.long1,"Phae.long1.wav") 
##D writeWave(Phae.long2,"Phae.long2.wav")
##D 
##D lspec(sxrow = 2, rows = 8, pal = reverse.heat.colors, wl = 300, it = "jpeg")
##D 
##D #now create single pdf removing jpeg
##D lspec2pdf(keep.img = FALSE)
##D 
##D # check this floder
##D getwd()
## End(Not run)




