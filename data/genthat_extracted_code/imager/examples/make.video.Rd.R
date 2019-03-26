library(imager)


### Name: make.video
### Title: Make/save a video using ffmpeg
### Aliases: make.video save.video

### ** Examples

## Not run
## iml <- map_il(seq(0,20,l=60),~ isoblur(boats,.))
## f <- tempfile(fileext=".avi")
## save.video(iml,f)
## load.video(f) %>% play
## #Making a video from a directory
## dd <- tempdir()
## for (i in 1:length(iml)) {
## png(sprintf("%s/image-%i.png",dd,i));
## plot(iml[[i]]); dev.off() }
## make.video(dd,f)
## load.video(f) %>% play



