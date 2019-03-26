library(ff)


### Name: symmIndex2vectorIndex
### Title: Array: make vector positions from symmetric array index
### Aliases: symmIndex2vectorIndex
### Keywords: array data

### ** Examples

  symmIndex2vectorIndex(rbind(
   c(1,1)
  ,c(1,10)
  ,c(10,1)
  ,c(10,10)
  ), dim=c(10,10))
  symmIndex2vectorIndex(rbind(
   c(1,1)
  ,c(1,10)
  ,c(10,1)
  ,c(10,10)
  ), dim=c(10,10), fixdiag=1)



