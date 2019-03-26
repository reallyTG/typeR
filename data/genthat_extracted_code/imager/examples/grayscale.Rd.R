library(imager)


### Name: grayscale
### Title: Convert an RGB image to grayscale
### Aliases: grayscale

### ** Examples

grayscale(boats) %>% plot
#In many pictures, the difference between Luma and XYZ conversion is subtle 
grayscale(boats,method="XYZ") %>% plot
grayscale(boats,method="XYZ",drop=FALSE) %>% dim



