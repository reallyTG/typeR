library(paleomorph)


### Name: mirrorfill
### Title: Fill missing symmetrical landmarks for all specimens in an array
###   using mirrored values from other side of a bilaterally symmetrical
###   object where present
### Aliases: mirrorfill

### ** Examples

 # Create array
 A <- array(rep(1:36, by = 4), dim = c(12, 3, 4))

 # Make it symmetrical
 A[7:12, 1:2, ] <- A[1:6, 1:2, ]
 A[7:12, 3, ] <- -A[1:6, 3, ]

 # Remove some data points
 missinga <- A
 missinga[1:2, , 1:3] <- NA

 mirrorA <- mirrorfill(missinga, l1 = c(3:6, 9:12), l2 = c(1, 7, 2, 8))




