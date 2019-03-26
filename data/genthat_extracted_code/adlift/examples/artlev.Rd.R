library(adlift)


### Name: artlev
### Title: artlev
### Aliases: artlev
### Keywords: arith

### ** Examples

#create test signal data
#
x<-runif(100)
y<-make.signal2("blocks",x=x)
#
#perform forward transform...
#
out<-fwtnp(x,y,LocalPred=AdaptNeigh,neighbours=2)
#
al<-artlev(out$lengthsremove,out$removelist)
#
#
# the indices of removelist split into levels:
al
#



