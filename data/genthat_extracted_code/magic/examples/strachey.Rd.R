library(magic)


### Name: strachey
### Title: Strachey's algorithm for magic squares
### Aliases: strachey
### Keywords: array

### ** Examples

 strachey(3)
 strachey(2,square=magic(5))

 strachey(2,square=magic(5)) %eq%  strachey(2,square=t(magic(5)))
 #should be FALSE

 #Show which numbers have been swapped:
 strachey(2,square=matrix(0,5,5))

 #It's still magic, but not normal:
  is.magic(strachey(2,square=matrix(0,5,5)))



