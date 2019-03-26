library(directPA)


### Name: rotate3d
### Title: Spherical Coordinates Rotation
### Aliases: rotate3d

### ** Examples

# load the example data
data(PM)

# convert statistics into z-scores
PM.zscores <- apply(PM, 2, function(x){qnorm(rank(x)/(nrow(PM)+1))})

# Rotate the matrix by contrast 1, -1, -1 (i.e. up-regulation, down-regulation, dow-regulation).
PM.rotated <- rotate3d(PM.zscores, contrast = c(1, -1, -1))




