library(Thermimage)


### Name: cumulDiff
### Title: Cumulative difference sum function for use with frame by frame
###   difference dataframe
### Aliases: cumulDiff

### ** Examples


# Create a vector of arbitrary frame times - these would be extracted normally using the 
# locateFrames and getTimes functions

start<-as.POSIXct("2017-03-31 12:00:00")
fdiff<-data.frame(matrix(runif(307200*20, 20, 40), nrow=307200))

# add noise to pixels
for(i in 1:20){
  randpixels<-floor(runif(10000, 1,307200))
  fdiff[randpixels,i]<-fdiff[randpixels,i]*runif(1, 10, 10000)
}

extract.times<-seq(start, start+20,1)
cumulDiff(fdiff, extract.times, 2)





