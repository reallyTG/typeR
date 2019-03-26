library(AnalyzeFMRI)


### Name: f.write.list.to.hdr
### Title: writes a .hdr file in ANALYZE format
### Aliases: f.write.list.to.hdr
### Keywords: utilities

### ** Examples

a<-array(rnorm(20*30*40*3),dim=c(20,30,40,3))
file<-"temp.hdr"
b<-f.basic.hdr.list.create(a, file)
f.write.list.to.hdr(b,file)


