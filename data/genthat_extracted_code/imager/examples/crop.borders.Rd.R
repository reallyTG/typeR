library(imager)


### Name: crop.borders
### Title: Crop the outer margins of an image
### Aliases: crop.borders

### ** Examples

#These two versions are equivalent
imfill(10,10) %>% crop.borders(nx=1,ny=1)
imfill(10,10) %>% crop.borders(nPix=1)

#Filter, keep valid part
correlate(boats,imfill(3,3)) %>% crop.borders(nPix=2)



