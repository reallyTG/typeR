library(warbleR)


### Name: catalog2pdf
### Title: 'catalog2pdf' combines 'catalog' images into pdfs
### Aliases: catalog2pdf

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
##D catalog(X = selec.table, nrow = 2, ncol = 4)
##D 
##D # now create single pdf removing jpeg
##D catalog2pdf(keep.img = FALSE)
##D 
##D # check this floder
##D getwd()
## End(Not run)



