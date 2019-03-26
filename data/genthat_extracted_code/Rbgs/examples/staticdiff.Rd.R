library(Rbgs)


### Name: staticdiff
### Title: Static frame difference background subtraction algorithm.
### Aliases: staticdiff

### ** Examples

 ## No test: 
videoURL <- system.file("extdata","daria_skip.avi",package = "Rbgs")
frames <- readvideoframe(videoURL,1,9)
bground<-staticdiff(frames,35) 
## End(No test)



