library(proteomicdesign)


### Name: power.single.cost
### Title: Derive the averaged estimated costs of stage II and III and the
###   stage III sample size from the 1000 Monte Carlo simulated functions
###   of a three-stage proteomic study, given a solution of the design
###   parameters
### Aliases: power.single.cost

### ** Examples

assaycost2=function(n,p){280*p+1015*n}
assaycost3=function(p){200*p}
protein<-data.frame(proteinid=c(100,101,103,104,105),beta=c(2.4,2.6,0.5,2.6,0.7),sigma=c(0.6,0.7,0.3,0.7,0.4),group=c(1,1,1,2,2))
initial=c(0.01,0.01,100)
power.single.cost(initial,protein=protein,artifact=rep(1,5),n1=30,budget=500000,s=1000,assaycost2.function=assaycost2,assaycost3.function=assaycost3,recruit=100,optimize=FALSE)



