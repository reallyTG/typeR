library(imager)


### Name: load.image
### Title: Load image from file or URL
### Aliases: load.image

### ** Examples

#Find path to example file from package
fpath <- system.file('extdata/Leonardo_Birds.jpg',package='imager') 
im <- load.image(fpath)
plot(im)
#Load the R logo directly from the CRAN webpage
#load.image("https://cran.r-project.org/Rlogo.jpg") %>% plot



