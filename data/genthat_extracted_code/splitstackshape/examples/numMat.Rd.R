library(splitstackshape)


### Name: numMat
### Title: Create a Numeric Matrix from a List of Values
### Aliases: numMat

### ** Examples


invec <- c("1,2,4,5,6", "1,2,4,5,6", "1,2,4,5,6",
           "1,2,4,5,6", "-1,1,2,5,6", "1,2,5,6")
A <- strsplit(invec, ",")
splitstackshape:::numMat(A)
splitstackshape:::numMat(A, fill = 0)
splitstackshape:::numMat(A, mode = "value")




