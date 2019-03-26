library(RHMS)


### Name: baseFlowSeparation
### Title: Parametric methods for separating baseflow
### Aliases: baseFlowSeparation
### Keywords: array

### ** Examples

Q<-Q<-(dnorm(seq(-3,4,length.out=200),-.3,1)+dnorm(seq(-1,7,length.out=200),4.5,1)*2)*1200
BFSMethod<-c('nathan','chapman','eckhardt','recession')
BFSParams<-list(alpha=0.6,BFI=0.3,k=1.1,timeInterval=15*60)
baseFlowSeparation(Q,BFSMethod[1],BFSParams)
baseFlowSeparation(Q,BFSMethod[2],BFSParams)
baseFlowSeparation(Q,BFSMethod[3],BFSParams)
baseFlowSeparation(Q,BFSMethod[4],BFSParams)



