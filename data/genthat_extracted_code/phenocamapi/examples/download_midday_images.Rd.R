library(phenocamapi)


### Name: download_midday_images
### Title: Downloading the midday images for PhenoCam sites given a time
###   range
### Aliases: download_midday_images

### ** Examples


download_dir <- download_midday_images('dukehw',
 y = 2018,
 months = 2,
 days=1,
 download_dir= tempdir())




