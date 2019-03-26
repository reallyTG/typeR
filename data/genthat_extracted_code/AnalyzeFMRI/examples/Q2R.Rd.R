library(AnalyzeFMRI)


### Name: Q2R
### Title: Quaternion to rotation
### Aliases: Q2R
### Keywords: utilities

### ** Examples

L <- f.read.nifti.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))
Q <- c(L$quatern.b,L$quatern.c,L$quatern.d)
Q2R(Q,L$pixdim[1])



