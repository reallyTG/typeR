library(NHMSAR)


### Name: simule.nh.MSAR
### Title: Simulation of (non) homogeneous Markov Stiwtching autoregressive
###   models
### Aliases: simule.nh.MSAR
### Keywords: Simulation MSAR

### ** Examples

data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
plot(data[,k,1],typ="l",xlab=("time (days)"),ylab=("temperature (Celsius degrees)"))
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]
# Fit Homogeneous MS-AR models
M = 2
order = 2
theta.init = init.theta.MSAR(data,M=M,order=order,label="HH") 
mod.hh = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=20)
# Simulation
yT = 31
Bsim = 1
Ksim = Bsim*N.samples
Y0 = array(data[1:2,sample(1:dim(data)[2],Ksim,replace=T),],c(2,Ksim,1))
Y.sim = simule.nh.MSAR(mod.hh$theta,Y0 = Y0,T,N.samples = Ksim) 
# Validation
# valid_all(data,Y.sim$Y,id=1,alpha=.05)

## Not run
#data(lynx)
#lyt <- log10(lynx)
#T = length(lynx)
#Y = array(lyt,c(T,1,1))
#theta = init.theta.MSAR(Y,M=2,order=2,label='NH',nh.transitions="logistic",ncov.trans=1)
#Z = array(lyt[1:(T-2)],c(T-2,1,1))
#res=fit.MSAR(lyt[3:T],theta,covar.trans=Z,verbose=TRUE)
#Y0 = lyt[1:2]
#Bsim = 20
#Y0 = array(data[1:2,sample(1:dim(data)[2],Bsim,replace=TRUE),],c(2,Bsim,1))
#Y.sim = simule.nh.MSAR(res$theta,Y0 = Y0,T,N.samples = Bsim,covar.trans=2)


