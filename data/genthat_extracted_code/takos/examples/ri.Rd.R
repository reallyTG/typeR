library(takos)


### Name: ri
### Title: Title running integral
### Aliases: ri

### ** Examples

## No test: 
#' require(data.table)
require(MASS)
rates=c(0.5,1,2,5,10,20,50)
a<-lapply(rates, function(x) JMA(A=exp(35),Ea=120000,T0=0,T.end=300,q=x,npoints=5000,n=2))
a<-lapply(seq(1,length(a)), function(x) data.table(a[[x]]$time.s,a[[x]]$T.C,
a[[x]]$dadT, rates[[x]]))
lapply(seq(1,length(a)), function(x) setnames(a[[x]],
c("time.seconds","temperature.s","heat.flow","rates") ) )
a.dt <-lapply(seq(1,length(a)), function(x) data.table(data.frame(a.check[[x]])))
a<-rbindlist(a.dt)
a$rate<-a$id
a.peaks <- a[,.(res.list = list(findpeaks(heat.flow,sortstr=TRUE,npeaks=2))),by=id]
a.peaks$rate<-a.peaks$id
ref.peak=1
a.peaks <- data.table(data.table(a.peaks$rate),rbindlist((lapply(a.peaks$res.list,
function(x) data.table(t(x[ref.peak,]))))))
colnames(a.peaks)<- c("rate","peak.value","ind.max","left.lim","right.lim")
a.mat<- lapply(unique(a$rate),function(x)
ri(a[a$rate==x]$time.seconds,a[a$rate==x]$heat.flow,a.peaks[rate==x]))
## End(No test)



