library(measuRing)


### Name: grayDarker
### Title: Gray extremes
### Aliases: grayDarker

### ** Examples

## (not run) read one image section:
image1 <- system.file("P105_a.png", package="measuRing")    
## (not run) gray matrix from RGB in image:
gray <- imageTogray(image = image1,ppi = 1000)
## (not run) smoothed gray:
smoothed <- graySmoothed(gray)
## (not run) column numbers of possitive and negative extremes:
posit <- grayDarker(smoothed,darker=FALSE)
nega <- grayDarker(smoothed,darker=TRUE)
str(nega)



