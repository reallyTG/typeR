library(imager)


### Name: save.image
### Title: Save image
### Aliases: save.image

### ** Examples

#Create temporary file
tmpF <- tempfile(fileext=".png")
#Save boats image
save.image(boats,tmpF)
#Read back and display
load.image(tmpF) %>% plot



