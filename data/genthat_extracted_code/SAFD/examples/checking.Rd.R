library(SAFD)


### Name: checking
### Title: Checking correct data format
### Aliases: checking
### Keywords: attribute classes

### ** Examples

#Example 1:
data(XX)
a<-checking(XX[[1]],1)
a

#Example 2:
X<-data.frame(y=c(-2,-0.75,-0.25,0.5,1),alpha=c(0,0.6,0.9,0.9,0))
a<-checking(X)
a

#Example 3:
X<-data.frame(x=c(-2,-0.75,-0.25,0.5,1),alpha=c(0,0.6,0.9,0.9,0))
a<-checking(X)
a

#Example 4:
X<-data.frame(x=c(-2,-0.75,-0.25,-0.5,1),alpha=c(0,0.6,1,1,0))
a<-checking(X)
a

#Example 5:
X<-data.frame(x=c(-2,-0.75,-0.25,0.5,1),alpha=c(0.3,0,1,0,0.3))
a<-checking(X)
a

#Example 6:
Y<-data.frame(x=c(-2,-0.75,-0.25,0.5,1),alpha=c(0,0.3,1,0,0.3))
a<-checking(Y)
a

#Example 7:
Z<-data.frame(x=c(-2,-0.75,-0.25,0.5,1),alpha=c(0,0.6,1,1,0))
a<-checking(Z)
a

#Example 8:
U<-data.frame(x=c(-1,0,1),alpha=c(0,1,0))
a<-checking(U,)
a



