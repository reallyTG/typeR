library(NHMSAR)


### Name: cor.MSAR
### Title: Empirical correlation functions comparison .
### Aliases: cor.MSAR
### Keywords: Auto-correlation function Validation

### ** Examples

## Not run
#data(Wind)
#T = dim(U)[1]
#N.samples = dim(U)[2]
#Y = array(U[,,1],c(T,N.samples,1))

#theta.init=init.theta.MSAR(Y,M=2,order=1,label="HH")
#res.hh = fit.MSAR(Y,theta.init,verbose=TRUE,MaxIter=10)
#Bsim = 2
#Ksim = Bsim*N.samples
#Y0 = array(Y[1,sample(1:dim(Y)[2],1,replace=T),],c(2,Ksim,1))
#Y.sim = simule.nh.MSAR(res.hh$theta,Y0 = Y0,T,N.samples = Ksim) 
#c = cor.MSAR(Y,Y.sim$Y)
#plot(c$lags/4,c$C.data,typ="l",xlab="Time (days)",ylab="ACF",xlim=c(0,8))
#abline(h=0,lty=3,col="gray")
#lines(c$lags/4,c$C.sim,col="red")
#lines(c$lags/4,c$CI.sim[1,],col="red",lty=2)
#lines(c$lags/4,c$CI.sim[2,],col="red",lty=2)



