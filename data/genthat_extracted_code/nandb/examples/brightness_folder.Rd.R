library(nandb)


### Name: brightness_folder
### Title: Brightness calculations for every image in a folder.
### Aliases: brightness_folder

### ** Examples

## Not run: 
##D setwd(tempdir())
##D img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
##D ijtiff::write_tif(img, 'img1.tif')
##D ijtiff::write_tif(img, 'img2.tif')
##D brightness_folder(def = "B", thresh = "Huang")
## End(Not run)



