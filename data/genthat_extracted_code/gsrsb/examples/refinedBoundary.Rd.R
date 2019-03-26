library(gsrsb)


### Name: refinedBoundary
### Title: Summarize Primary and Refined Secondary Boundaries, Nominal
###   Significance
### Aliases: refinedBoundary

### ** Examples

require(mvtnorm)
require(ldbounds)
result <- refinedBoundary(alpha=0.05,tVec=c(0.2,0.6,1),SpeedQuality="fastest")
result$primaryBoundary
result$secondaryBoundary
result$nomialSignificance




