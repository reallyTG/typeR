library(AnalyzeFMRI)


### Name: f.write.list.to.hdr.nifti
### Title: writes a .hdr file in NITI format
### Aliases: f.write.list.to.hdr.nifti
### Keywords: utilities

### ** Examples

a<-array(rnorm(20*30*40*3),dim=c(20,30,40,3))
file<-"temp.hdr"
b<-f.basic.hdr.nifti.list.create(dim(a), file)
f.write.list.to.hdr.nifti(b,file)


