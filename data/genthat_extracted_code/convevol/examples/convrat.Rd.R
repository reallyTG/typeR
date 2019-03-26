library(convevol)


### Name: convrat
### Title: Quantifies convergent evolution using the C1, C2, C3, and C4
###   measures as described by Stayton (2015).
### Aliases: convrat

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
convtips<-c("t1","t2","t3")
answer<-convrat(phyl,phendata,convtips)



