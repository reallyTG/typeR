library(Rbgs)


### Name: readvideoframe
### Title: Read the specified frames of a video.
### Aliases: readvideoframe

### ** Examples

##Save the URL of the video file into R session and then load the required videoframes
videoURL <- system.file("extdata","jog.mp4",package = "Rbgs")
frames <- readvideoframe(videoURL,213,233)



