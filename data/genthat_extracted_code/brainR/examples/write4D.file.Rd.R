library(brainR)


### Name: write4D.file
### Title: Write a 4D scene
### Aliases: write4D.file

### ** Examples


template <- readNIfTI(system.file("MNI152_T1_8mm_brain.nii.gz", package="brainR")
, reorient=FALSE)
dtemp <- dim(template)
### 4500 - value that empirically value that presented a brain with gyri
### lower values result in a smoother surface
brain <- contour3d(template, x=1:dtemp[1], y=1:dtemp[2],
z=1:dtemp[3], level = 4500, alpha = 0.8, draw = FALSE)

### Example data courtesy of Daniel Reich
### Each visit is a binary mask of lesions in the brain
imgs <- paste("Visit_", 1:5, "_8mm.nii.gz", sep="")
files <- sapply(imgs, system.file, package='brainR')
scene <- list(brain)
## loop through images and thresh
nimgs <- length(imgs)
cols <- rainbow(nimgs)
for (iimg in 1:nimgs) {
mask <- readNIfTI(files[iimg], reorient=FALSE)
if (length(dim(mask)) > 3) mask <- mask[,,,1]
### use 0.99 for level of mask - binary
  activation <- contour3d(mask, level = c(0.99), alpha = 1,
  add = TRUE, color=cols[iimg], draw=FALSE)
## add these triangles to the list
scene <- c(scene, list(activation))
}
## make output image names from image names
fnames <- c("brain.stl", gsub(".nii.gz", ".stl", imgs, fixed=TRUE))
outfile <-  "index_4D_stl.html"
write4D.file(
scene=scene, fnames=fnames, 
visible = FALSE,
outfile=outfile, standalone=TRUE, rescale=TRUE)



