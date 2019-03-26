library(Thermimage)


### Name: frameLocates
### Title: Find the frame read start positions in a thermal video file.
### Aliases: frameLocates

### ** Examples


x<-frameLocates(vidfile = system.file("extdata", "SampleSEQ.seq", package = "Thermimage"))
x$h.start
x$f.start




