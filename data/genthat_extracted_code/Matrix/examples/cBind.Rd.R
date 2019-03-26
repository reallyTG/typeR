library(Matrix)


### Name: cBind
### Title: Versions of 'cbind' and 'rbind' recursively built on
###   cbind2/rbind2
### Aliases: cBind rBind
### Keywords: array manip

### ** Examples

(a <- matrix(c(2:1,1:2), 2,2))
D <- Diagonal(2)
if(getRversion() < "3.2.0") {
 M1 <- cbind(0, rBind(a, 7))
 print(M1) # remains traditional matrix

 M2 <- cBind(4, a, D, -1, D, 0) # a sparse Matrix
 print(M2)

} else { ## newer versions of R do not need cBind / rBind:

 M1 <- cbind(0, suppressWarnings(rBind(a, 7)))
 print(M1) # remains traditional matrix

 M2 <- suppressWarnings(cBind(4, a, D, -1, D, 0)) # a sparse Matrix
 print(M2)

 stopifnot(identical(M1, cbind(0, rbind(a, 7))),
           identical(M2, cbind(4, a, D, -1, D, 0)))
}# R >= 3.2.0



