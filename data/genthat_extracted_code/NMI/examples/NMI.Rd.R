library(NMI)


### Name: NMI
### Title: Normalized Mutual Information of Community Structure in Network
### Aliases: NMI

### ** Examples

# Suppose X and Y are exactly the same
X<-data.frame(c(1,2,3),c(2,1,1))
Y<-X
# There NMI is 1
NMI(X,Y)

# Suppose X and Y are completely independent
X<-data.frame(c(1,2,3),c(2,1,1))
Y<-data.frame(c(5,6,7),c(2,1,1))
# There NMI is 0
NMI(X,Y)



