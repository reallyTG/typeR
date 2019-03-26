library(MCPAN)


### Name: summary.binomORci
### Title: Detailed print out for binomORci
### Aliases: summary.binomORci
### Keywords: print

### ** Examples


x<-c(1,3,6,7,5)
n<-c(30,30,30,30,30)
names<-LETTERS[1:5]

ORD<-binomORci(x=x, n=n, names=names,
 type="Dunnett", alternative="greater")
summary(ORD)

ORW<-binomORci(x=x, n=n, names=names,
 type="Williams", alternative="greater")
summary(ORW)





