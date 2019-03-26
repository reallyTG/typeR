library(SAFD)


### Name: Msum
### Title: Minkowski sum
### Aliases: Msum
### Keywords: arith manip

### ** Examples

#Example 1:
X<-data.frame(x=c(0,1,1.5,3),alpha=c(0,1,1,0))
Y<-data.frame(x=c(1.25,2.75,2.75,5),alpha=c(0,1,1,0))
sum<-Msum(list(X,Y))
sum

#Example 2:
data(XX)
X<-translator(XX[[1]],50)
Y<-translator(XX[[2]],50)
Z<-translator(XX[[3]],50)
YY<-list(X,Y,Z)
M<-Msum(YY)



