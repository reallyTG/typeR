library(CopCTS)


### Name: estCopC
### Title: Pseudo maximum likelihood estimator of the copula parameter
### Aliases: estCopC

### ** Examples

### Using a simulated data for demonstration:
set.seed(20)
Y = genLatentY(cop="Clayton",1,30,MARGIN.inv = qt,df=3)
d = -1
Yc = pmax(d,Y)
delta = (Y>d)
## CopC estimator
estCopC(cop = "Clayton",Yc,d,delta,nIS = 50,interval = c(1,10))
## Omniscient estimator
estCopC(cop = "Clayton",Y,d,delta=rep(TRUE,length(Y)),interval = c(1,10))
## CopC estimator under true marginal
estCopC(cop = "Clayton",Yc,d,delta,nIS = 50,MARGIN=pt,df=3,interval = c(1,10))
### Analyze the water quality data:
attach(water)
Yc = TNH3[1:30]
delta = Delta[1:30]
jumps = Indep[1:30]
set.seed(1)
estCopC(cop="Clayton",Yc=Yc,d=0.02,delta=delta,jumps=jumps,interval = c(1,10),nIS=50)



