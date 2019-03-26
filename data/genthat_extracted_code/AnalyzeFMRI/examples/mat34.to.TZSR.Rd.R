library(AnalyzeFMRI)


### Name: mat34.to.TZSR
### Title: Affine 4x4 (or 3x4) matrix to Translation, Scale, Shear and
###   Rotation
### Aliases: mat34.to.TZSR
### Keywords: utilities

### ** Examples

L <- f.read.nifti.header(system.file("example-nifti.hdr", package="AnalyzeFMRI"))
M <- rbind(L$srow.x,L$srow.y,L$srow.z)
mat34.to.TZSR(M)



