library(oro.nifti)


### Name: translateCoordinate
### Title: Translate Voxel Coordinates
### Aliases: translateCoordinate

### ** Examples


ffd <- readNIfTI(file.path(system.file("nifti", package="oro.nifti"),
                           "filtered_func_data"))
xyz <- c(1,1,1)
translateCoordinate(xyz, ffd, verbose=TRUE)
xyz <- trunc(dim(ffd)[1:3]/2)
translateCoordinate(xyz, ffd, verbose=TRUE)



