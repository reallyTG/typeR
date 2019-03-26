library(magic)


### Name: apl
### Title: Replacements for APL functions take and drop
### Aliases: apl take apldrop apltake apldrop<- apltake<-
### Keywords: array

### ** Examples

a <- magichypercube.4n(m=1)
apltake(a,c(2,3,2))
apldrop(a,c(1,1,2))

b <- matrix(1:30,5,6)
apldrop(b,c(1,-2)) <- -1

b <- matrix(1:110,10,11)
apltake(b,2) <- -1
apldrop(b,c(5,-7)) <- -2
b




