library(imager)


### Name: imdraw
### Title: Draw image on another image
### Aliases: imdraw

### ** Examples

im <- load.example("parrots")
boats.small <- imresize(boats,.5)
#I'm aware the result is somewhat ugly 
imdraw(im,boats.small,x=400,y=10,opacity=.7) %>% plot



