library(AnalyzeFMRI)


### Name: R2Q
### Title: Rotation to quaternion
### Aliases: R2Q
### Keywords: utilities

### ** Examples

L <- f.read.nifti.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))
Q <- c(L$quatern.b,L$quatern.c,L$quatern.d)
R <- Q2R(Q,L$pixdim[1])
Q
R2Q(R)



