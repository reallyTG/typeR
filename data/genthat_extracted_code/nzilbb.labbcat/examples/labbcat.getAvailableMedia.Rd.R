library(nzilbb.labbcat)


### Name: labbcat.getAvailableMedia
### Title: List the media available for the given graph.
### Aliases: labbcat.getAvailableMedia
### Keywords: audio media

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List the media files available for BR2044_OllyOhlson.eaf
media <- labbcat.getAvailableMedia(labbcat, "BR2044_OllyOhlson.eaf")




