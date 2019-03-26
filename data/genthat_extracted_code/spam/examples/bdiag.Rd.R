library(spam)


### Name: bdiag
### Title: Binds Arrays Corner-to-Corner
### Aliases: bdiag bdiag.spam
### Keywords: array algebra

### ** Examples

A <- diag.spam(2, 4)           # 2*I4
B <- matrix(1,3,3)
AB <- bdiag.spam(A,B)

# equivalent to:
ABalt <- rbind(cbind( A, matrix(0,nrow(A),ncol(B))),
               cbind( matrix(0,nrow(B),ncol(A)), B))
         
norm(AB-ABalt)


# Matrices do not need to be square:
bdiag.spam(1,2:5,6)



