library(AcuityView)


### Name: AcuityView
### Title: AcuityView
### Aliases: AcuityView

### ** Examples

require(imager)
photo<-system.file('extdata/reef.bmp', package='AcuityView')
reef<-load.image(photo)
AcuityView(photo = reef, distance = 2, realWidth = 2, eyeResolutionX = 2,
eyeResolutionY = NULL, plot = TRUE, output="Example.jpeg")



