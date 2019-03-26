library(rje)


### Name: arrayInd
### Title: Faster calculation of array indices from vector position.
### Aliases: arrayInd
### Keywords: array

### ** Examples

arr = array(1:36, dim=c(2,3,2,3))
ind = arrayInd(c(4,9,17), c(2,3,2,3))
ind

arr[2,2,1,1]
arr[1,2,2,1]
arr[1,3,1,2]



