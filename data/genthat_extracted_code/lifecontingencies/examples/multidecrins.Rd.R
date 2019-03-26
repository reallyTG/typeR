library(lifecontingencies)


### Name: Axn.mdt
### Title: Multiple decrement life insurance
### Aliases: Axn.mdt

### ** Examples

#creates a temporary mdt
myTable<-data.frame(x=41:43,lx=c(800,776,752),d1=rep(8,3),d2=rep(16,3))
myMdt<-new("mdt",table=myTable,name="ciao")
Axn.mdt(myMdt, x=41,n=2,i=.05,decrement="d2")



