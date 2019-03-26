library(rje)


### Name: indexBox
### Title: Get indices of adjacent entries in array
### Aliases: indexBox
### Keywords: array

### ** Examples

arr = array(1:144, dim=c(3,4,3,4))
arr[2,2,2,3]
# which are entries within 1 unit each each direction of 2,2,2,3?

inds = 89 + indexBox(1,-1,c(3,4,3,4))
inds = inds[inds > 0 & inds <= 144]
arrayInd(inds, c(3,4,3,4))

# what about just in second dimension?
inds = 89 + indexBox(c(0,1,0,0),c(0,-1,0,0),c(3,4,3,4))
inds = inds[inds > 0 & inds <= 144]
arrayInd(inds, c(3,4,3,4))



