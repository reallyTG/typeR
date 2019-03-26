library(spate)


### Name: loglike
### Title: Log-likelihood of the hyperparameters.
### Aliases: loglike

### ** Examples

n <- 20
T <- 20
##Specify hyper-parameters
par <- c(rho0=0.1,sigma2=0.2,zeta=0.5,rho1=0.1,gamma=2,alpha=pi/4,muX=0.2,muY=-0.2,tau2=0.01)
##Simulate data
spateSim <- spate.sim(par=par,n=n,T=T,seed=4)
w <- spateSim$w

##Initial values for optim. This takes a couple of seconds.
parI <- c(rho0=0.2,sigma2=0.1,zeta=0.25,rho1=0.01,gamma=1,alpha=0.3,muX=0,muY=0,tau2=0.005)
logInd=c(1,2,3,4,5,9)
##Transform to log-scale
parI[logInd] <- log(parI[logInd])

##Fourier transform needs to be done only once
wFT <- real.fft.TS(w,n=n,T=T)
##ML estimation using optim, takes a couple of seconds
##Load the precomputed object a line below to save time
spateMLE <-
optim(par=parI,loglike,control=list(trace=TRUE,maxit=1000),wFT=wFT,method="L-BFGS-B",
     lower=c(-10,-10,-10,-10,-10,0,-0.5,-0.5,-10),
     upper=c(10,10,10,10,10,pi/2,0.5,0.5,10),negative=TRUE,
     logScale=TRUE,hessian=TRUE,n=n,T=T)
##data("spateMLE")

mle <- spateMLE$par
mle[logInd] <- exp(mle[logInd])
sd=sqrt(diag(solve(spateMLE$hessian)))

MleConfInt <- data.frame(array(0,c(4,9)))
colnames(MleConfInt) <- names(par)
rownames(MleConfInt) <- c("True","Estimate","Lower","Upper")
MleConfInt[1,] <- par
MleConfInt[2,] <- mle
MleConfInt[3,] <- spateMLE$par-2*sd
MleConfInt[4,] <- spateMLE$par+2*sd
MleConfInt[c(3,4),logInd] <- exp(MleConfInt[c(3,4),logInd])
cat("\n")
round(MleConfInt,digits=4)




