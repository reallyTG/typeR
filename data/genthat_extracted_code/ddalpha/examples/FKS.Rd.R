library(ddalpha)


### Name: FKS
### Title: Fast Kernel Smoothing
### Aliases: FKS
### Keywords: functional kernel smoothing

### ** Examples

d = 10
T = sort(runif(d))
X = T^2+ rnorm(d,sd=.1)
Tout = seq(0,1,length=101)

plot(T,X)
dataf = list(list(args=T,vals=X))
data.sm = FKS(dataf,Tout,kernel="Epan")
lines(data.sm[[1]]$args,data.sm[[1]]$vals,col=2)

datafs = structure(list(dataf=dataf,labels=1:length(dataf)),class="functional")
plot(datafs)
points(T,X)
data.sms = structure(list(dataf=data.sm,labels=1:length(data.sm)),class="functional")
plot(data.sms)

n = 6
dataf = list()
for(i in 1:n) dataf[[i]] = list(args = T<-sort(runif(d)), vals = T^2 + rnorm(d,sd=.1))
data.sm = FKS(dataf,Tout,kernel="triweight")
data.sms = structure(list(dataf=data.sm,labels=1:length(data.sm)),class="functional")
plot(data.sms)



