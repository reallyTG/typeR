library(geomorph)


### Name: interlmkdist
### Title: Calculate linear distances between landmarks
### Aliases: interlmkdist
### Keywords: utilities

### ** Examples

 
data(plethodon)
# Make a matrix defining three interlandmark distances 
lmks <- matrix(c(8,9,6,12,4,2), ncol=2, byrow=TRUE, 
dimnames = list(c("eyeW", "headL", "mouthL"),c("start", "end")))
# where 8-9 is eye width; 6-12 is head length; 4-2 is mouth length
# or alternatively
lmks <- data.frame(eyeW = c(8,9), headL = c(6,12), mouthL = c(4,2), 
row.names = c("start", "end")) 
A <- plethodon$land
lineardists <- interlmkdist(A, lmks)



