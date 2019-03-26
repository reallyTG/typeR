library(AnalyzeFMRI)


### Name: fps2diminfo
### Title: fps2diminfo
### Aliases: fps2diminfo
### Keywords: utilities

### ** Examples

dim.info <- f.read.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))$dim.info
mylist <- diminfo2fps(dim.info)
fps2diminfo(mylist$freq.dim,mylist$phase.dim,mylist$slice.dim)



