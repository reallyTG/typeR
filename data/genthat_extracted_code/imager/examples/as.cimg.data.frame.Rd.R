library(imager)


### Name: as.cimg.data.frame
### Title: Create an image from a data.frame
### Aliases: as.cimg.data.frame

### ** Examples

#Create a data.frame with columns x,y and value
df <- expand.grid(x=1:10,y=1:10) %>% dplyr::mutate(value=x*y)
#Convert to cimg object (2D, grayscale image of size 10*10
as.cimg(df,dims=c(10,10,1,1)) %>% plot



