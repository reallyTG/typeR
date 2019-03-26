library(mets)


### Name: summary.cor
### Title: Summary for dependence models for competing risks
### Aliases: summary.cor
### Keywords: survival

### ** Examples

library("timereg")
data("multcif",package="mets") # simulated data 
multcif$cause[multcif$cause==0] <- 2

times=seq(0.1,3,by=0.1) # to speed up computations use only these time-points
add<-comp.risk(Event(time,cause)~const(X)+cluster(id),data=multcif,
               n.sim=0,times=times,cause=1)
###
out1<-cor.cif(add,data=multcif,cause1=1,cause2=1,theta=log(2+1))
summary(out1)

pad <- predict(add,X=1,Z=0,se=0,uniform=0)
summary(out1,marg.cif=pad)



