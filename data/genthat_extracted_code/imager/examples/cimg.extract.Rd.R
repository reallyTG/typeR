library(imager)


### Name: cimg.extract
### Title: Various shortcuts for extracting colour channels, frames, etc
### Aliases: cimg.extract frame imcol imrow channel R G B

### ** Examples

#Extract the red channel from the boats image, then the first row, plot
rw <- R(boats) %>% imrow(10)
plot(rw,type="l",xlab="x",ylab="Pixel value")
#Note that R(boats) returns an image
R(boats)
#while imrow returns a vector or a list
R(boats) %>% imrow(1) %>% str
imrow(boats,1) %>% str




