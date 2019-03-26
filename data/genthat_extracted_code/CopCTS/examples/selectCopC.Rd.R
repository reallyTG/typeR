library(CopCTS)


### Name: selectCopC
### Title: The selection of copula function
### Aliases: selectCopC

### ** Examples

### Example with simulated data
set.seed(20)
Y = genLatentY("Clayton",1,30,MARGIN.inv = qt,df=3)
d = -1
Yc = pmax(d,Y)
delta = (Y>d)
selectCopC(cop.type=c("Clayton","Frank"),Yc = Yc,d = d,delta = delta,nIS=50)
### Example with water data
attach(water)
Yc = TNH3[1:30]
delta = Delta[1:30]
jumps = Indep[1:30]
set.seed(1)
intv.Gaussian = c(-1,1)
intv.Clayton = c(0,20)
intv.Frank = c(0,15)
intervals = cbind(intv.Gaussian,intv.Clayton,intv.Frank)
cop.type = c("Gaussian","Clayton","Frank")
selCopC <- selectCopC(cop.type=cop.type,Yc=Yc,d=0.02,
            delta=delta,nIS = 50,jumps=jumps,intervals=intervals)
selCopC$Selected



