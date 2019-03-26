library(Thermimage)


### Name: diffFrame
### Title: A frame difference function for subtracting adjacent frames from
###   an imported thermal image sequence.
### Aliases: diffFrame

### ** Examples


# set w to 640 and h to 480
w<-640
h<-480
f<-system.file("extdata", "SampleSEQ.seq", package = "Thermimage")
x<-frameLocates(f)
suppressWarnings(templookup<-raw2temp(1:65535))
alldata<-unlist(lapply(x$f.start, getFrames, vidfile=f, w=w, h=h))
alldata<-matrix(alldata, nrow=w*h, byrow=FALSE)
alltemperature<-templookup[alldata]
alltemperature<-unname(matrix(alltemperature, nrow=w*h, byrow=FALSE))

dalltemperature<-as.matrix(diffFrame(alltemperature, absolute=TRUE), nrow=w)

# Plot 
plotTherm(dalltemperature[,1], templookup=NULL, w=w, h=h,  minrangeset=min(dalltemperature),
          maxrangeset=max(dalltemperature), trans="mirror.matrix")






