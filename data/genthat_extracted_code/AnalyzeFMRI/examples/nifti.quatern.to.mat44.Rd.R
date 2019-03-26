library(AnalyzeFMRI)


### Name: nifti.quatern.to.mat44
### Title: Quaternion (etc..) to affine 4x4 matrix
### Aliases: nifti.quatern.to.mat44
### Keywords: utilities

### ** Examples

L <- f.read.nifti.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))
nifti.quatern.to.mat44(L)



