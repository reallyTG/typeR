library(nzilbb.labbcat)


### Name: labbcat.getMedia
### Title: Gets a given media track for a given graph.
### Aliases: labbcat.getMedia
### Keywords: audio media

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get URL for the WAV file for BR2044_OllyOhlson.eaf
media <- labbcat.getMedia(labbcat, "BR2044_OllyOhlson.eaf")

## Get URL for the 'QuakeFace' video file for BR2044_OllyOhlson.eaf
media <- labbcat.getMedia(labbcat, "BR2044_OllyOhlson.eaf", "_face", "video/mp4")




