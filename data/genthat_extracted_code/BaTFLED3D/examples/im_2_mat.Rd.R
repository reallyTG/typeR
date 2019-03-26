library(BaTFLED3D)


### Name: im_2_mat
### Title: Plot heatmaps of two matrices in red and blue
### Aliases: im_2_mat

### ** Examples

par(mfrow=c(1,2))
im_2_mat(matrix(1:12, nrow=3, ncol=4),  matrix(13:24, nrow=3, ncol=4), sort=FALSE, scale=FALSE)
im_2_mat(matrix(1:12, nrow=3, ncol=4),  matrix(13:24, nrow=3, ncol=4), sort=TRUE, scale=FALSE)
im_2_mat(matrix(1:12, nrow=3, ncol=4),  matrix(13:24, nrow=3, ncol=4), sort=TRUE, scale=TRUE)
im_2_mat(matrix(1:12, nrow=3, ncol=4),  matrix(13:24, nrow=3, ncol=4), sort=FALSE, 
         scale=FALSE, center=TRUE)



