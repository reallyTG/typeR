library(imager)


### Name: erode
### Title: Erode/dilate image by a structuring element.
### Aliases: erode erode_rect erode_square dilate dilate_rect dilate_square
###   mopening mopening_square mclosing_square mclosing

### ** Examples

fname <- system.file('extdata/Leonardo_Birds.jpg',package='imager')
im <- load.image(fname) %>% grayscale
outline <- threshold(-im,"95%")
plot(outline)
mask <- imfill(5,10,val=1) #Rectangular mask
plot(erode(outline,mask))
plot(erode_rect(outline,5,10)) #Same thing
plot(erode_square(outline,5)) 
plot(dilate(outline,mask))
plot(dilate_rect(outline,5,10))
plot(dilate_square(outline,5)) 



