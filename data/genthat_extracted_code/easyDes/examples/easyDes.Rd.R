library(easyDes)


### Name: easyDes
### Title: An Easy Way to Descriptive Analysis
### Aliases: easyDes
### Keywords: Descriptive analysis

### ** Examples

group=rep(c(0,1),each=30)
nx1=rnorm(60)
nx2=rnorm(60)
fx1=rep(c(1:3),20)
fx2=rep(c(1:5),12)
fx3=factor(fx2)
data=data.frame(group,nx1,nx2,fx1,fx2,fx3)

easyDes(nc.g=1,nc.n=2:3,nc.f=4:5,nc.of=6,dataIn=data,
        fisher=TRUE,aov=FALSE,t=FALSE,mean=FALSE,mcp.stat=FALSE)
easyDes(nc.g=4,nc.n=2:3,nc.f=c(5,5),nc.of=6,dataIn=data,
        fisher=TRUE,aov=FALSE,t=FALSE,mean=FALSE,mcp.stat=FALSE)
easyDes(nc.g=4,nc.n=3,nc.f=5,nc.of=6,dataIn=data,
        fisher=TRUE,aov=FALSE,t=FALSE,mean=FALSE,mcp.stat=TRUE)



