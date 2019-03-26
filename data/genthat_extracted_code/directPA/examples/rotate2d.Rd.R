library(directPA)


### Name: rotate2d
### Title: Polar Coordinates Rotation
### Aliases: rotate2d

### ** Examples

# load the phosphoproteomics dataset
data(HEK)

# convert statistics into z-scores
HEK.zscores <- apply(HEK, 2, function(x){qnorm(rank(x)/(nrow(HEK)+1))})

# Rotate the matrix by 1/2 pi (i.e. down-regulation, dow-regulation).
HEK.rotated <- rotate2d(HEK.zscores, degree = pi/2)




