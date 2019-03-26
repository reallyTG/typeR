library(liftLRD)


### Name: artificial.levels
### Title: artificial.levels
### Aliases: artificial.levels
### Keywords: arith

### ** Examples

#create test signal data
#
library(adlift)
x<-runif(100)
y<-make.signal2("blocks",x=x)
#
#perform forward transform...
#
out<-fwtnp(x,y,LocalPred=AdaptNeigh,neighbours=2)
#
al<-artificial.levels(out$lengthsremove,out$removelist, x, type = 1)
#
#
# the indices of removelist split into levels:
al
#



