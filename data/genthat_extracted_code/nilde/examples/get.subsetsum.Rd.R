library(nilde)


### Name: get.subsetsum
### Title: Enumeration of all existing 0-1 and bounded solutions of a
###   subset sum problem
### Aliases: get.subsetsum

### ** Examples

## some examples...
b1 <- get.subsetsum(a=c(41,34,21,20,8,7,7,4,3,3),M=10,n=50,problem="subsetsum01")
b1
colSums(b1$solutions*c(41,34,21,20,8,7,7,4,3,3))

b2 <- get.subsetsum(a=c(111:120),M=10,n=485,problem="subsetsum01") ## no solutions
b2

b3 <- get.subsetsum(a=c(30,29,32,31,33),M=5,n=91,problem="subsetsum01")
b3
colSums(b3$solutions*c(30,29,32,31,33))
get.subsetsum(a=c(30,29,32,31,33),M=5,n=91,problem="bsubsetsum",bounds=c(1,1,1,1,1))

b4 <- get.subsetsum(a=c(30,29,32,31,33),M=5,n=91,problem="bsubsetsum",
                 bounds=c(1,2,1,3,4))
b4
colSums(b4$solutions*c(30,29,32,31,33))



