library(Rbgs)


### Name: admedian
### Title: Adaptive meadian background subtraction algorithm
### Aliases: admedian

### ** Examples

 ## No test: 
videoURL <- system.file("extdata","daria_skip.avi",package = "Rbgs")
frames <- readvideoframe(videoURL,1,15)
bground<-admedian(frames,3,25) 
## End(No test)




