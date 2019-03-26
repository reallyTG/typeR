library(Rbgs)


### Name: totalframe
### Title: Total number of frames in a video.
### Aliases: totalframe

### ** Examples

##Save the URL of the video file into R session and then load videoframes
videoURL <- system.file("extdata","daria_skip.avi",package = "Rbgs")
no_of_frames <- totalframe(videoURL)



