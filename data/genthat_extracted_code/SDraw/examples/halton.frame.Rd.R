library(SDraw)


### Name: halton.frame
### Title: Construct a Halton sampling frame.
### Aliases: halton.frame

### ** Examples

# The following is equivalent to hal.point(WA.cities,20,J=c(6,3))

# Define Halton lattice
attr(WA.cities,"J") <- c(6,3)
attr(WA.cities,"bases") <- c(2,3)

# Add tiny amount to right and top of bounding box because Halton boxes are 
# closed on the left and bottom.  This includes points exactly on top and right 
# bounding lines.
attr(WA.cities,"hl.bbox") <- bbox(WA.cities) + c(0,0,1,1) 

# Compute Halton indices
frame <- halton.indices( WA.cities )

# Separate points in frame that are in same box
frame <- halton.frame( frame )

# Draw sample of size 20
n <- 20
random.start <- floor( runif(1,0,nrow(frame)-1 ) )
samp <- frame[ ( ((0:(n-1))+random.start) %% nrow(frame) ) + 1, ]




