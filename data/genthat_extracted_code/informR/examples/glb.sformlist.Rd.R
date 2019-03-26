library(informR)


### Name: glb.sformlist
### Title: Generate a list of global S-form sequence statistics.
### Aliases: glb.sformlist

### ** Examples

example(gen.sformlist)
x<-list(c("aa","bb","cc"),c("ba","ca"))
tb1<-glb.sformlist(eventlist,sforms=x,new.names=c("inertia","afollows"))
rem(eventlist$eventlist,slbind(tb1,alpha.ints))



