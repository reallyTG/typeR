library(splitstackshape)


### Name: charMat
### Title: Create a Binary Matrix from a List of Character Values
### Aliases: charMat

### ** Examples


invec <- c("rock,electro","electro","rock,jazz")
A <- strsplit(invec, ",")
splitstackshape:::charMat(A)
splitstackshape:::charMat(A, 0)
splitstackshape:::charMat(A, mode = "value")




