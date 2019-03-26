library(AnalyzeFMRI)


### Name: ijk2xyz
### Title: ijk2xyz
### Aliases: ijk2xyz
### Keywords: utilities

### ** Examples

L <- f.read.header(system.file("example-nifti.hdr",
package="AnalyzeFMRI"))
ijk <- matrix(c(1,1,1,2,3,7),byrow=FALSE,nrow=3)
ijk2xyz(ijk=ijk,method=2,L)



