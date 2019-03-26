library(imager)


### Name: as.data.frame.imlist
### Title: Convert image list to data.frame
### Aliases: as.data.frame.imlist

### ** Examples

#Transform the image gradient into a data.frame
gr <- imgradient(boats,"xy") %>% setNames(c("dx","dy")) %>% as.data.frame
str(gr)



