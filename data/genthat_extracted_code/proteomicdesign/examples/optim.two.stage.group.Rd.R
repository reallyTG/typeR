library(proteomicdesign)


### Name: optim.two.stage.group
### Title: Optimization of the design parameters in the discovery ,
###   verification and validation stage from a multi-stage clinical
###   proteomic study using biological grouping information
### Aliases: optim.two.stage.group

### ** Examples

assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4),group=c(1,1,1,2,2))
optim.two.stage.group(budget=500000,protein=protein,n1=60,artifact=rep(1,5),iter.number=1,assaycost2.function=assaycost2,assaycost3.function=assaycost3)



