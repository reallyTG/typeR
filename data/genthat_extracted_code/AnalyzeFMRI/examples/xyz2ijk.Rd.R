library(AnalyzeFMRI)


### Name: xyz2ijk
### Title: xyz2ijk
### Aliases: xyz2ijk
### Keywords: utilities

### ** Examples

L <- f.read.header(system.file("example-nifti.hdr",
package="AnalyzeFMRI"))
xyz <- matrix(c(1,1,1,2,3,7),byrow=FALSE,nrow=3)
xyz2ijk(xyz=xyz,method=2,L)



