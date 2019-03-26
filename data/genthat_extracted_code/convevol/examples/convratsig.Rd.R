library(convevol)


### Name: convratsig
### Title: Tests the signifiance of convergent evolution by the ratio of
###   the current to maximum past phenotypic distance
### Aliases: convratsig

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
convtips<-c("t1","t2","t3")
answer<-convratsig(phyl,phendata,convtips,10)



