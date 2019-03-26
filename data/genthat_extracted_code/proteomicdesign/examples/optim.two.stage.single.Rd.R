library(proteomicdesign)


### Name: optim.two.stage.single
### Title: Optimization of the number of discoveries from a multistage
###   clinical proteomic study
### Aliases: optim.two.stage.single

### ** Examples

## An example of 5 proteins from an immunology proteomic study
assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4))
optim.two.stage.single(budget=500000,artifact=rep(1,5),protein=protein,n1=30,iter.number=1,assaycost2.function=assaycost2,assaycost3.function=assaycost3,n2.min=30,n2.max=100,n2.step=10) 



