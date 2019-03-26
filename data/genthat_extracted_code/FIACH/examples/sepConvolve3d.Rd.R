library(FIACH)


### Name: sepConvolve3d
### Title: Fast 3d Convolution
### Aliases: sepConvolve3d

### ** Examples

func<-readNii(system.file("extdata","motion_ex.nii.gz",package="FIACH"))

kernx<-gaussKernel(8,21,3.33)
kerny<-gaussKernel(8,21,3.33)
kernz<-gaussKernel(8,21,4)

smooth<-sepConvolve3d(func,kernx,kerny,kernz)



