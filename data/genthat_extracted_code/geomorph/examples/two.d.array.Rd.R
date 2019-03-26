library(geomorph)


### Name: two.d.array
### Title: Convert (p x k x n) data array into 2D data matrix
### Aliases: two.d.array
### Keywords: utilities

### ** Examples

data(plethodon) 
plethodon$land    #original data in the form of 3D array

two.d.array(plethodon$land)   # Convert to a 2D data matrix



