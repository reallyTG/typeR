library(AnalyzeFMRI)


### Name: st2xyzt
### Title: st2xyzt
### Aliases: st2xyzt
### Keywords: utilities

### ** Examples

xyzt.units <- f.read.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))$xyzt.units
mylist <- xyzt2st(xyzt.units)
st2xyzt(mylist$space,mylist$time)



