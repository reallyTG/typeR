library(paleomorph)


### Name: mirrorfill1
### Title: Fill missing landmarks for a single specimen using mirrored
###   values from other side of object
### Aliases: mirrorfill1

### ** Examples

 # Make data that is reflected in x plane
 s <- matrix(rep(1:21, 2), byrow = TRUE, ncol = 3)
 s[1:7, 1] <- -s[1:7, 1]

 # Now remove some data
 s[1, ] <- NA
 
 # Mirror point 1 using it's complimentary landmark, point 8.
 mirrorS <- mirrorfill1(s, l1 = c(2:7, 9:14), l2 = c(1, 8))



