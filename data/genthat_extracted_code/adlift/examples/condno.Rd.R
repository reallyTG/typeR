library(adlift)


### Name: condno
### Title: condno
### Aliases: condno
### Keywords: array algebra

### ** Examples

#create test signal data
#
x<-runif(100)
y<-make.signal2("blocks",x=x)
#
a<-fwtnp(x,y,LocalPred=AdaptNeigh,neigh=2,do.W=TRUE,varonly=FALSE)
#
#computes the transition matrix for the specified options
#
W<-a$W
#
condno(W,"F")
#
condno(W,"l1")
#
condno(W,"1")
# 



