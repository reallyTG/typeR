library(imager)


### Name: plot.imlist
### Title: Plot an image list
### Aliases: plot.imlist

### ** Examples

imsplit(boats,"c") #Returns an image list
imsplit(boats,"c") %>% plot
imsplit(boats,"c") %>% plot(layout="row")
imsplit(boats,"c") %>% plot(layout="col")
imsplit(boats,"x",5) %>% plot(layout="rect")



