library(NHMSAR)


### Name: simule.nh.MSAR.VM
### Title: Simulation of (non) homogeneous Markov Stiwtching autoregressive
###   models von Mises innovations
### Aliases: simule.nh.MSAR.VM
### Keywords: Simulation MSAR von Mises

### ** Examples

	##Not run
#data(WindDir)
#T = dim(WindDir)[1]
#N.samples = dim(WindDir)[2]
#Y = array(WindDir,c(T,N.samples,1))
# von Mises homogeneous MSAR
#M = 2
#order = 1
#theta.init = init.theta.MSAR.VM(Y,M=M,order=order,label="HH")
#polar.hh = fit.MSAR.VM(Y,theta.init,MaxIter=50,verbose=TRUE,eps=1e-8)

#K.sim = 1
#Y0 = array(Y[1:2,sample(1:N.samples,K.sim,replace=T),],c(2,K.sim,1))
#sim.dir = simule.nh.MSAR.VM(polar.hh$theta,Y0=Y0,T,N.samples=K.sim)

## Not run
#theta.init$mu = polar.hh$theta$mu
# theta.init$kappa = polar.hh$theta$kappa+1i*0 # kappa complex
# theta.init$prior = polar.hh$theta$prior
# theta.init$transmat = polar.hh$theta$transmat
# polar.hh.c = fit.MSAR.VM(Y,theta.init,MaxIter=50,verbose=TRUE,eps=1e-8)
	
# theta.init = init.theta.MSAR.VM(Y,M=M,order=order,label="NH",ncov=1,nh.transitions="VM")
# theta.init$mu = polar.hh.c$theta$mu
# theta.init$kappa = polar.hh.c$theta$kappa # kappa complex
# theta.init$prior = polar.hh.c$theta$prior
# theta.init$transmat = polar.hh.c$theta$transmat
# theta.init$par.trans =  matrix(c(polar.hh.c$theta$mu,.1*matrix(1,M,1)),M,2)+1i
#Y.tmp = array(Y[2:T,,],c(T-1,N.samples,1))
#Z = array(Y[1:(T-1),,],c(T-1,N.samples,1))
# polar.nh.c = fit.MSAR.VM(Y.tmp,theta.init,MaxIter=1,verbose=T,eps=1e-8,covar.trans=Z)
#K.sim = 100
#Y0 = array(Y[1:2,sample(1:N.samples,K.sim,replace=T),],c(2,K.sim,1))
#sim.dir = simule.nh.MSAR.VM(polar.nh.c$theta,Y0=Y0,T,N.samples=K.sim,covar.trans=1)





