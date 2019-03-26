library(AnalyzeFMRI)


### Name: f.write.nifti
### Title: writes an array to a .img/.hdr pair in NIFTI format or to a .nii
###   file
### Aliases: f.write.nifti
### Keywords: utilities

### ** Examples

a<-array(rnorm(20*30*40*3),dim=c(20,30,40,3))
file<-"temp"
f.write.nifti(a,file,size="float",nii=TRUE)



