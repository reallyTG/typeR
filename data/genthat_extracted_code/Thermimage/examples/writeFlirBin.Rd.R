library(Thermimage)


### Name: writeFlirBin
### Title: Saves thermal image data to a binary file
### Aliases: writeFlirBin

### ** Examples


bindata<-floor(runif(307200, 17000, 25000))
templookup<-raw2temp(bindata)
w<-640
h<-480
Interval<-0.03
f.root<-"Thermalvid"

# Usage:
# writeFlirBin(bindata, templookup=templookup,  w=w, h=h, Interval=Interval, rootname=f.root)




