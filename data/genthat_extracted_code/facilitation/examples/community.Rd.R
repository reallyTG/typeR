library(facilitation)


### Name: community
### Title: community
### Aliases: community

### ** Examples

param <- data.frame(D=c(2,1,2,1),G=c(2,0,2,0),R=c(0,3,0,3),dispersal=c(0,2,0,20))
malth <- community(2,c(2,2),param,init=c(10,10,10,10))
ab <- abundance.matrix(malth)
stackplot(ab[,1:2]) # species 1
stackplot(ab[,3:4]) # species 2



