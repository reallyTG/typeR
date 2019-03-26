library(RHMS)


### Name: loss
### Title: Excess rainfall computation
### Aliases: loss
### Keywords: graphs

### ** Examples

precipitation<-sin(seq(0.1,pi-0.1,length.out=10))*30
lossParams<-list(f0=20,f1=5,k=2,CN=65)
simulation<-c(interval=3600,period=NA)
lossMethod<-c("horton","SCS")
Horton_loss<-loss(precipitation,lossParams,simulation,lossMethod[1])
SCS_loss<-loss(precipitation,lossParams,simulation,lossMethod[2])



