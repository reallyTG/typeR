library(Thermimage)


### Name: thermsum
### Title: Return summary of thermal image data.
### Aliases: thermsum

### ** Examples

# set w to 640 and h to 480
w<-640
h<-480
f<-system.file("extdata", "SampleSEQ.seq", package = "Thermimage")
x<-frameLocates(f)
suppressWarnings(templookup<-raw2temp(1:65535))
alldata<-unlist(lapply(x$f.start, getFrames, vidfile=f, w=w, h=h))
alldata<-matrix(alldata, nrow=w*h, byrow=TRUE)

# Summary on one image or frame of data
thermsum(alldata[,1], templookup)

# Summary on multi-frame seq file
tsum<-data.frame(t(apply(alldata, 2, thermsum, templookup)))
tsum

# Randomly generated data
alldata<-floor(runif(w*h*10, 17000, 25000))
alldata<-matrix(alldata, nrow=w*h)

# depending on the size of alldata, directly calculating temperature can slow down processing
# For a 10 frame file:
system.time(alltemperature<-raw2temp(alldata))

# But summary calculations using raw binary with lookup are slightly slower than
# using numeric temperatures:

# Perform calculations on the raw binary but supply the templookup vector
system.time(tsum<-data.frame(t(apply(alldata, 2, thermsum, templookup))))

# Perform calculations on the converted temperature values
system.time(tsum<-data.frame(t(apply(alltemperature, 2, thermsum))))
tsum






