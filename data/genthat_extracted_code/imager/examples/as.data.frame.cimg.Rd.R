library(imager)


### Name: as.data.frame.cimg
### Title: Convert a pixel image to a data.frame
### Aliases: as.data.frame.cimg

### ** Examples


#First five pixels
as.data.frame(boats) %>% head(5)
#Wide format along colour axis
as.data.frame(boats,wide="c") %>% head(5)



