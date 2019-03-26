library(RNifti)


### Name: voxelToWorld
### Title: Transform points between voxel and "world" coordinates
### Aliases: voxelToWorld worldToVoxel origin

### ** Examples

im <- readNifti(system.file("extdata", "example.nii.gz", package="RNifti"))

# Find the origin
origin(im)




