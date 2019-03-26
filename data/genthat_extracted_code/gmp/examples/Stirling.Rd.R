library(gmp)


### Name: Stirling
### Title: Eulerian and Stirling Numbers of First and Second Kind
### Aliases: Eulerian Stirling1 Stirling2 Eulerian.all Stirling1.all
###   Stirling2.all
### Keywords: arithmetic

### ** Examples

Stirling1(7,2)
Stirling2(7,3)

stopifnot(
 Stirling1.all(9) == c(40320, -109584, 118124, -67284, 22449, -4536, 546, -36, 1)
 ,
 Stirling2.all(9) == c(1, 255, 3025, 7770, 6951, 2646, 462, 36, 1)
 ,
 Eulerian.all(7) == c(1, 120, 1191, 2416, 1191, 120, 1)
)



