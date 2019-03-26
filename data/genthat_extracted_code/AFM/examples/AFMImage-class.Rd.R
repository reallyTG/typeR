library(AFM)


### Name: AFMImage-class
### Title: AFM image class
### Aliases: AFMImage-class AFMImage initialize,AFMImage-method AFMImage

### ** Examples

library(AFM)
library(data.table)

# create a 128 pixels by 128 pixels AFM image
Lines=128
Samplesperline=128
fullfilename="RandomFakeAFMImage"
# the size of scan is 128 nm
ScanSize=128
# the heights is a normal distribution in nanometers
nm<-c(rnorm(128*128, mean=0, sd=1 )) 

scanby<-ScanSize/Samplesperline
endScan<-ScanSize*(1-1/Samplesperline)
RandomFakeAFMImage<-AFMImage(
     data = data.table(x = rep(seq(0,endScan, by= scanby), times = Lines),
                       y = rep(seq(0,endScan, by= scanby), each = Samplesperline), 
                       h = nm),
     samplesperline = Samplesperline, lines = Lines, 
     vscansize = ScanSize, hscansize = ScanSize, scansize = ScanSize, 
     fullfilename = fullfilename )



