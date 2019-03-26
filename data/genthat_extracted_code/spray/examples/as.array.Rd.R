library(spray)


### Name: as.array
### Title: Coerce spray objects to arrays
### Aliases: as.array as.array.spray dim.spray
### Keywords: symbolmath

### ** Examples


M <- matrix(sample(0:4,28,replace=TRUE),ncol=4)
S <- spray(M,sample(7),addrepeats=TRUE)
A <- as.array(S,offbyone=TRUE) 



S <- spray(matrix(sample(1:4,28,replace=TRUE),ncol=4),sample(7))
A <- as.array(S)   # S has no zero indices

stopifnot(all(S[index(S),drop=TRUE] == A[index(S)])) 



