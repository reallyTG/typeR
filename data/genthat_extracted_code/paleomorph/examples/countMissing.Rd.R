library(paleomorph)


### Name: countMissing
### Title: Count the number of missing landmarks in an array
### Aliases: countMissing

### ** Examples




 A <- array(1:(3*6*7), dim = c(7, 3, 6))
 A[2, , 1] <- NA
 countMissing(A)



