library(calibrator)


### Name: dists.2frames
### Title: Distance between two points
### Aliases: dists.2frames
### Keywords: array

### ** Examples

data(toys)

dists.2frames(a=D2.toy,A=diag(2))

A <- diag(2) + matrix(0.2,2,2)
A.lower <- t(chol(A))
jj.1 <- dists.2frames(a=D2.toy, A=A, test=TRUE)
jj.2 <- dists.2frames(a=D2.toy, A=A, test=FALSE)

jj.3 <- dists.2frames(a=D2.toy, A.lower=A.lower, test=FALSE)
jj.4 <- dists.2frames(a=D2.toy, A.lower=A.lower, test=TRUE)





