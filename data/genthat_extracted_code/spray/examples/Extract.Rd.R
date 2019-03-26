library(spray)


### Name: Extract.spray
### Title: Extract or Replace Parts of a spray
### Aliases: [.spray [<-.spray
### Keywords: symbolmath

### ** Examples

a <- spray(diag(5))
a[rbind(rep(1,5))] <- 5

a[3,4,5,3,1]  # the NULL polynomial

a[0,1,0,0,0]
a[0,1,0,0,0,drop=TRUE]

a[2,3:5,4,3,3] <- 9


options(polyform = TRUE)   # print as a multivariate polynomial
a

options(polyform = FALSE)  # print is sparse array form
a


S1 <- spray(diag(5),1:5)
S2 <- spray(1-diag(5),1:5)
S1[] <- 3
S1[] <- S2







