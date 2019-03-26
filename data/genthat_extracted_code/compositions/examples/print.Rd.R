library(compositions)


### Name: print.acomp
### Title: Printing compositional data.
### Aliases: print.acomp print.rcomp print.rplus print.aplus
### Keywords: classes

### ** Examples

data(SimulatedAmounts)
mydata <- simulateMissings(sa.groups5,dl=0.01,knownlimit=TRUE,
                     MAR=0.05,MNARprob=0.05,SZprob=0.05)
mydata[1,1]<-BDLvalue
print(aplus(mydata))
print(aplus(mydata),digits=3)
print(acomp(mydata))
print(rplus(mydata))
print(rcomp(mydata))




