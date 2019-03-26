library(AnalyzeFMRI)


### Name: f.complete.hdr.nifti.list.create
### Title: creates complete .hdr list in NIFTI format
### Aliases: f.complete.hdr.nifti.list.create
### Keywords: utilities

### ** Examples

dim.mat <- c(20,30,40,3)
dim <- c(length(dim.mat), dim.mat, rep(0, 7 - length(dim.mat)))
filename <- "temp.hdr"
f.complete.hdr.nifti.list.create(file=filename,dim=dim)



