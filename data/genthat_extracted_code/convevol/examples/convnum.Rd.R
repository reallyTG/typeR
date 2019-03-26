library(convevol)


### Name: convnum
### Title: Quantify convergence by the number of convergent events
### Aliases: convnum

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
convtips<-c("t1","t2","t3")
answer<-convnum(phyl,phendata,convtips,plot=TRUE,ellipse=NULL,plotellipse=NULL)



