library(oro.nifti)


### Name: quaternion2rotation
### Title: Convert Quaternion into a Rotation Matrix
### Aliases: quaternion2rotation quaternion2mat44

### ** Examples


## This R matrix is represented by quaternion [a,b,c,d] = [0,1,0,0]
## (which encodes a 180 degree rotation about the x-axis).
(R <- quaternion2rotation(1, 0, 0))



