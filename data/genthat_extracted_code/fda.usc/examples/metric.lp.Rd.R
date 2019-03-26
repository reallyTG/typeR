library(fda.usc)


### Name: metric.lp
### Title: Approximates Lp-metric distances for functional data.
### Aliases: metric.lp
### Keywords: cluster

### ** Examples


#	INFERENCE PHONDAT
data(phoneme)
mlearn<-phoneme$learn[1:100]
mtest<-phoneme$test[1:100]
glearn<-phoneme$classlearn[1:100]
gtest<-phoneme$classtest[1:100]
# Matrix of distances of curves of DATA1
mdist1<-metric.lp(mlearn)

# Matrix of distances between curves of DATA1 and curves of DATA2
mdist2<-metric.lp(mlearn,mtest,lp=2)
# mdist with L1 norm and weigth=v
v=dnorm(seq(-3,3,len=dim(mlearn)[2]))
mdist3<-metric.lp(mlearn,mtest,lp=1,w=v)
plot(1:100,mdist2[1,],type="l",ylim=c(1,max(mdist3[1,])))
lines(mdist3[1,],type="l",col="2")

# mdist with mlearn with different discretization points.
#mlearn2=mlearn
#mlearn2[["argvals"]]=seq(0,1,len=150)
#mdist5<-metric.lp(mlearn,mlearn2)
#mdist6<-metric.lp(mlearn2,mlearn) 
#sum(mdist5-mdist6)
#sum(mdist1-mdist6)

x<-seq(0,2*pi,length=1001)
fx<-fdata(sin(x)/sqrt(pi),x)
fx0<-fdata(rep(0,length(x)),x)
metric.lp(fx,fx0)
# The same
integrate(function(x){(abs(sin(x)/sqrt(pi))^2)},0,2*pi)





