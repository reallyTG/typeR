library(NHMSAR)


### Name: fit.MSAR.VM
### Title: Fit von Mises (non) homogeneous Markov switching autoregressive
###   models
### Aliases: fit.MSAR.VM
### Keywords: von Mises MSAR

### ** Examples

	## Not run
# data(WindDir)
# T = dim(WindDir)[1]
# N.samples = dim(WindDir)[2]
# Y = array(WindDir,c(T,N.samples,1))
# von Mises homogeneous MSAR
# M = 2
# order = 2
# theta.init = init.theta.MSAR.VM(Y,M=M,order=order,label="HH")
# res.hh = fit.MSAR.VM(Y,theta.init,MaxIter=3,verbose=TRUE,eps=1e-8)
## von Mises non homogeneous MSA
# theta.init = init.theta.MSAR.VM(Y,M=M,order=order,label="NH",ncov=1,nh.transitions="VM")
#theta.init$mu = res.hh$theta$mu
#theta.init$kappa = res.hh$theta$kappa
#theta.init$prior = res.hh$theta$prior
#theta.init$transmat = res.hh$theta$transmat
#theta.init$par.trans = matrix(c(res.hh[[M]][[order+1]]$theta$mu,.1*matrix(1,M,1)),2,2)
#Y.tmp = array(Y[2:T,,],c(T-1,N.samples,1))
#Z = array(Y[1:(T-1),,],c(T-1,N.samples,1))
#res.nh = fit.MSAR.VM(Y.tmp,theta.init,MaxIter=10,verbose=T,eps=1e-8,covar.trans=Z)



