library(mistat)


### Name: COMPURESP
### Title: Computer Response Time Optimization
### Aliases: COMPURESP
### Keywords: datasets

### ** Examples

data(COMPURESP)

layout(matrix(1:4, 2, byrow=TRUE))

with(COMPURESP,
     interaction.plot(
       x.factor=F, 
       trace.factor=rep(0, length(F)), 
       response=SN, 
       legend=FALSE,
       type="b",
       pch=15:18,
       ylim=c(-17, -10)))

with(COMPURESP,
     interaction.plot(
       x.factor=B, 
       trace.factor=rep(0, length(B)), 
       response=SN, 
       legend=FALSE,
       type="b",
       pch=15:18,
       ylim=c(-17, -10)))

with(COMPURESP,
     interaction.plot(
       x.factor=C, 
       trace.factor=rep(0, length(C)), 
       response=SN, 
       legend=FALSE,
       type="b",
       pch=15:18,
       ylim=c(-17, -10)))

with(COMPURESP,
     interaction.plot(
       x.factor=D, 
       trace.factor=rep(0, length(D)), 
       response=SN, 
       legend=FALSE,
       type="b",
       pch=15:18,
       ylim=c(-17, -10)))

layout(1)



