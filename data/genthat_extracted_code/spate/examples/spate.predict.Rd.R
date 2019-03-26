library(spate)


### Name: spate.predict
### Title: Obtain samples from predictive distribution in space and time.
### Aliases: spate.predict

### ** Examples

par <- c(rho0=0.1,sigma2=0.2,zeta=0.5,rho1=0.1,gamma=2,alpha=pi/4,muX=0.2,muY=-0.2,tau2=0.01)
##Simulate data
spateSim <- spate.sim(par=par,n=20,T=20,seed=4)
w <- spateSim$w
data("spateMCMC")
##Make predictions. Takes a couple of seconds
predict <- spate.predict(y=w,tPred=(17:25),spateMCMC=spateMCMC,Nsim =200,
                      BurnIn=10,DataModel="Normal")

Pmean <- apply(predict,c(1,2),mean)
Psd <- apply(predict,c(1,2),sd)

par(mfrow=c(2,2))
image(1:20,1:20,matrix(w[19,],nrow=20),main="Observed field at t=19",xlab="x",ylab="y")
image(1:20,1:20,matrix(Pmean[3,],nrow=20),main="Fitted field at t=19",xlab="x",ylab="y")
image(1:20,1:20,matrix(w[20,],nrow=20),main="Observed field at t=20",xlab="x",ylab="y")
image(1:20,1:20,matrix(Pmean[4,],nrow=20),main="Fitted field at t=20",xlab="x",ylab="y")

par(mfrow=c(3,3))
zlim=c(min(Pmean),max(Pmean))
for(i in 1:9){
  image(1:20,1:20,matrix(Pmean[i,],nrow=20),zlim=zlim,
        main=paste("Mean t=",i+16,sep=""),xlab="x",ylab="y")
}

par(mfrow=c(3,3))
zlim=c(min(Psd),max(Psd))
for(i in 1:9){
  image(1:20,1:20,matrix(Psd[i,],nrow=20),zlim=zlim,
        main=paste("Std.dev. t=",i+16,sep=""),xlab="x",ylab="y")
}



