library(exact2x2)


### Name: borrTest
### Title: Boundary-Optimized Rejection Region Test
### Aliases: borrTest borrPvals borrOrdering
### Keywords: htest

### ** Examples

## Not run: borrTest(4,4,1,4)
# Note Figure 2 in Gabriel et al is incorrect. The correct value 
# is in the response letter, and given by 
borrOrdering(4,4,tuningParm=0.025)$rankMat



