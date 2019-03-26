library(Phase123)


### Name: ReturnOCS
### Title: Gives operating characteristics of phase 123 and conventional
###   design.
### Aliases: ReturnOCS

### ** Examples

##True Mean Control
CMu=24
##True Means Agent
Means = c(27,32,38,42,28)
##Desired improvement in mean survival
Delta=12
##Random Trial results
 Results=as.list(c(0,0))
 nSims=5
 X=matrix(rep(NA,nSims*4),nrow=nSims)
 ##DoseSelected
 X[,1]=c(2,3,4,4,3)
 X[,2]=c(0,1,1,1,1)
 X[,3]=c(270,500,500,420,400)
 X[,4]=c(70,85,88,70,88)
 Results[[1]]=X
 X[,1]=c(2,3,5,4,2)
 X[,2]=c(0,1,0,1,0)
 X[,3]=c(270,500,450,420,415)
 X[,4]=c(70,82,80,70,79)
Results[[2]]=X
Hyp=1
ReturnOCS(Results,Means,CMu,Delta,Hyp)



