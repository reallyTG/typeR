library(Thermimage)


### Name: plotTherm
### Title: Plot thermal image data for visualisation purposes.
### Aliases: plotTherm

### ** Examples


m = 400 # grid size
C = complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ), 
imag=rep(seq(-1.2,1.2, length.out=m), m ) )
C = matrix(C,m,m)

Z = 0
X = array(0, c(m,m,20))

for (k in 1:10) {
  Z = Z^2+C
  X[,,k] = exp(-abs(Z))
}

for (k in 1:10){
  x<-as.matrix(X[,,k], nrow=400)
  x[is.na(x)]<-min(x, na.rm=TRUE)
  plotTherm(x, w=400, h=400, minrangeset=min(x), maxrangeset=max(x))
}


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

# Plot 
plotTherm(alldata[,2], templookup=templookup, w=w, h=h,  minrangeset=min(alldata),
          maxrangeset=max(alldata), trans="mirror.matrix")


# Plot all frames using binary data with templookup
x<-apply(alldata, 2, plotTherm, templookup=templookup, w=w, h=h, minrangeset=20, 
maxrangeset=40, trans="mirror.matrix")

# Plot all frames using converted temperature data
x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
         maxrangeset=max(alltemperature), thermal.palette=flirpal, trans="mirror.matrix")

# Try other palettes:
#x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
#maxrangeset=max(alltemperature), thermal.palette=rainbowpal, trans="mirror.matrix")

#x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
#maxrangeset=max(alltemperature), thermal.palette=midgreypal, trans="mirror.matrix")

#x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
#maxrangeset=max(alltemperature), thermal.palette=midgreenpal, trans="mirror.matrix")

#x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
#maxrangeset=max(alltemperature), thermal.palette=greyredpal, trans="mirror.matrix")

#x<-apply(alltemperature, 2, plotTherm, w=w, h=h, minrangeset=min(alltemperature),
#maxrangeset=max(alltemperature), thermal.palette=hotironpal, trans="mirror.matrix")





