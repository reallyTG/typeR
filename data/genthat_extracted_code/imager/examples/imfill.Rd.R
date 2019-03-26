library(imager)


### Name: imfill
### Title: Create an image of custom size by filling in repeated values
### Aliases: imfill

### ** Examples


imfill(20,20) %>% plot #Blank image of size 20x20
imfill(20,20,val=c(1,0,0)) %>% plot #All red image
imfill(20,20,val="red") %>% plot #Same, using R colour name
imfill(dim=dim(boats)) #Blank image of the same size as the boats image



