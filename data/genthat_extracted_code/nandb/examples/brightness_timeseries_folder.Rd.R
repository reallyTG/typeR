library(nandb)


### Name: brightness_timeseries_folder
### Title: Brightness time-series calculations for every image in a folder.
### Aliases: brightness_timeseries_folder

### ** Examples

## Not run: 
##D setwd(tempdir())
##D img <- ijtiff::read_tif(system.file('extdata', '50.tif', package = 'nandb'))
##D ijtiff::write_tif(img, 'img1.tif')
##D ijtiff::write_tif(img, 'img2.tif')
##D brightness_timeseries_folder(def = "e", thresh = "tri", frames_per_set = 20)
## End(Not run)



