library(SDraw)


### Name: halton.indices
### Title: Halton indices
### Aliases: halton.indices

### ** Examples

# The following is equivalent to hal.point(WA.cities,25,J=c(3,2))
#
# Add tiny amount to right and top of bounding box because Halton boxes are 
# closed on the left and bottom.  This includes points exactly on the bounding lines.
bb <- bbox(WA.cities) + c(0,0,1,1) 

# Compute Halton indices
frame <- halton.indices( WA.cities, J=c(3,2), hl.bbox=bb  )

# Construct Halton frame
frame <- halton.frame( frame )

# Draw HAL sample
n <- 25
N.frame <- nrow(frame)
m <- floor(runif(1, 0, N.frame)) # Integer 0,...,N.frame-1
ind <- (((0:(n-1))+m) %% N.frame ) + 1  # Cycle around frame if necessary
samp <- frame[ind,]  # draw sample





