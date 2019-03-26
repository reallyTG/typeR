library(Rbgs)


### Name: readvideo
### Title: Read a Video
### Aliases: readvideo

### ** Examples

##Save the URL of the video file into R session and then load videoframes
videoURL <- system.file("extdata","daria_skip.avi",package = "Rbgs")
frames <- readvideo(videoURL)



