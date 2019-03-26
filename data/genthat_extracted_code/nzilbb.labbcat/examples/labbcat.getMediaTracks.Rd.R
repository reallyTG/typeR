library(nzilbb.labbcat)


### Name: labbcat.getMediaTracks
### Title: List the predefined media tracks available for transcripts.
### Aliases: labbcat.getMediaTracks
### Keywords: media sound

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get the media tracks configured in LaBB-CAT
tracks <- labbcat.getMediaTracks(labbcat)




