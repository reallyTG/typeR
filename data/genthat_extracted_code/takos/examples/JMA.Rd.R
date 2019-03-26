library(takos)


### Name: JMA
### Title: Title Johnson-Mehl-Avrami (JMA)
### Aliases: JMA

### ** Examples

data <- JMA(A = exp(35),Ea = 120000,q = 50,T0 = -100,T.end = 300,npoints=898,n=2)

require(data.table)
#choose the rates for the simulation of the thermograms
rates=c(0.5,1,2,5,10,20,50)
#first serie of thermograms for all the chosen rate
a<-lapply(rates, function(x) JMA(A=exp(35),Ea=120000,T0=0,T.end=300,q=x,npoints=5000,n=2))
#setup column names
a<-lapply(seq(1,length(a)), function(x) data.table(a[[x]]$time.s,
a[[x]]$T.C, a[[x]]$dadT, rates[[x]]))
lapply(seq(1,length(a)), function(x) setnames(a[[x]],
c("time.seconds","temperature.s","heat.flow","rates") ) )
#create a plot using the function thermo
amaxH <- max(sapply(a, function(x) max(x$heat.flow))) # calculate the max
plot(c(0,300),c(0,amaxH),mytitle="dataset A 120/60 0.66/0.33",
ylab="ExothermicHeatFlow", xlab="Temperature")
lapply(a, function(x) lines(x$temperature.s,x$heat.flow,lwd=3))



