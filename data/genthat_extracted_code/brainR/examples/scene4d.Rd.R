library(brainR)


### Name: scene4d
### Title: Wrapper to write a 4D scene
### Aliases: scene4d

### ** Examples

### Faster - 8mm resampled but very coarse
imgs <- paste("Visit_", 1:5, "_8mm.nii.gz", sep="") 
 files <- sapply(imgs, system.file, package='brainR')
scene4d(files, levels=rep(0.99, length(files)), color= rep("blue", length(files)), useTemp=TRUE, 
MNITemp = "8mm", alpha = rep(1, length(files)), rescale=TRUE  )
## Not run: 
##D imgs <- paste("Visit_", 1:5, ".nii.gz", sep="") 
##D  files <- sapply(imgs, system.file, package='brainR')
##D scene4d(files, levels=rep(0.99, length(files)), color= rep("blue", length(files)), useTemp=TRUE, 
##D MNITemp = "8mm", alpha = rep(1, length(files)), rescale=TRUE  )
## End(Not run)



