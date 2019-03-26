library(nilde)


### Name: nlde
### Title: Enumeration of all existing nonnegative integer solutions of a
###   linear Diophantine equation
### Aliases: nlde

### ** Examples

## some examples...
## example 1...
nlde(a=c(3,2,5,16),n=18,at.most=TRUE)
b1 <- nlde(a=c(3,2,5,16),n=18,M=6,at.most=FALSE)
b1
## checking M, the number of parts that n=18 has been partitioned into...
colSums(b1$solutions)
## checking the value of n...
colSums(b1$solutions*c(3,2,5,16))

## example 2:  solving 0-1 nlde ...
b2 <- nlde(a=c(3,2,5,16),n=18,M=6,option=1)
b2
colSums(b2$solutions*c(3,2,5,16))

## example 3...
b3 <- nlde(c(15,21),261)
b3 
## checking M, the number of parts that n has been partitioned into...
colSums(b3$solutions)
## checking the value of n...
colSums(b3$solutions*c(15,21))

## example 4... 
nlde(c(5,6),19) ## no solutions

## example 5: solving 0-1 inequality...
b4 <- nlde(a=c(70,60,50,33,33,33,11,7,3),n=100,at.most=TRUE,option=2)





