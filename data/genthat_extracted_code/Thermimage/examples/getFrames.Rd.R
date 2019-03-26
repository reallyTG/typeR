library(Thermimage)


### Name: getFrames
### Title: Extract raw binary thermal from thermal image file.
### Aliases: getFrames

### ** Examples

# set w to 640 and h to 480

w<-640
h<-480
f<-system.file("extdata", "SampleSEQ.seq", package = "Thermimage")
x<-frameLocates(f)

# Slow approach:
system.time({
  alldata<-matrix(nrow=w*h, ncol=length(x$f.start))
  for(i in 1:length(x$f.start)) alldata[,i]<-getFrames(f, x$f.start[i], w, h)
})
dim(alldata)

# Faster approach
alldata<-NULL
system.time(alldata<-unlist(lapply(x$f.start, getFrames, vidfile=f, w=w, h=h)))
length(alldata)/(w*h)

# Parallel approach (will not be faster on small files)
library(parallel)
alldata<-NULL
# set mc.cores to higher number to use parallel processing
system.time(alldata<-unlist(mclapply(x$f.start, getFrames, vidfile=f, mc.cores=1)))
length(alldata)/(w*h) # number of frames in video




