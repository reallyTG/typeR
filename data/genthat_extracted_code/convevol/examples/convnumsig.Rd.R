library(convevol)


### Name: convnumsig
### Title: Assess the significance of convergent evolution using
###   simulations and the convnum metric
### Aliases: convnumsig

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
convtips<-c("t1","t2","t3")
answer<-convnumsig(phyl,phendata,convtips,10,plot=FALSE,ellipse=NULL,plotellipse=NULL)



