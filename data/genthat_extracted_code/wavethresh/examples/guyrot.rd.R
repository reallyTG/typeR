library(wavethresh)


### Name: guyrot
### Title: Cyclically rotate elements of a vector
### Aliases: guyrot
### Keywords: math

### ** Examples

#
# Start off with an example vector
#
v <- c(1,2,3,4,5,6)
#
# Rotate it one element to the right, rightmost element gets rotated round
# to be first element.
#
guyrot(v,1)
# [1] 6 1 2 3 4 5
#
# Rotate v two spaces to the left, leftmost two elements get rotated around
# to be new last elements
guyrot(v, -2)
#
# [1] 3 4 5 6 1 2
#
#
# Now issue a larger rotation, e.g. 19!
#
guyrot(v,19)
# [1] 6 1 2 3 4 5
#
# Its just the same as rotating by 1 since the input vector is of length 6
# and so rotating by 19 is the same as rotating by 6,6,6, and then 1!
#



