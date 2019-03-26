library(NHMSAR)


### Name: fit.MSAR (NH-MSAR)
### Title: Fit (non) homogeneous Markov switching autoregressive models
### Aliases: fit.MSAR
### Keywords: MSAR Model fitting Maximum likelihood

### ** Examples

# Fit Homogeneous MS-AR models - univariate time series
data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]
M = 2
order = 2
theta.init = init.theta.MSAR(data,M=M,order=order,label="HH") 
mod.hh = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=20)
#regimes.plot.MSAR(mod.hh,data,ylab="temperatures") 
#Y0 = array(data[1:2,sample(1:dim(data)[2],1),],c(2,1,1))
#Y.sim = simule.nh.MSAR(mod.hh$theta,Y0 = Y0,T,N.samples = 1)

## Not run
# Fit Non Homogeneous MS-AR models - univariate time series
#data(lynx)
#T = length(lynx)
#data = array(log10(lynx),c(T,1,1))
#theta.init = init.theta.MSAR(data,M=2,order=2,label="HH")
#mod.lynx.hh = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=200)
#regimes.plot.MSAR(mod.lynx.hh,data,ylab="Captures number")

#theta.init = init.theta.MSAR(data,M=2,order=2,label="NH",nh.transitions="logistic")
attributes(theta.init)
#theta.init$A0 = mod.lynx.hh$theta$A0
#theta.init$A = mod.lynx.hh$theta$A
#theta.init$sigma = mod.lynx.hh$theta$sigma
#theta.init$transmat = mod.lynx.hh$theta$transmat
#theta.init$prior = mod.lynx.hh$theta$prior
#Y = array(data[2:T,,],c(T-1,1,1))
#Z = array(data[1:(T-1),,],c(T-1,1,1))
#mod.lynx = fit.MSAR(Y,theta.init,verbose=TRUE,MaxIter=200,covar.trans=Z)
#regimes.plot.MSAR(mod.lynx,Y),ylab="Captures number")

# Fit Homogeneous MS-AR models - multivariate time series
#data(PibDetteDemoc)
#T = length(unique(PibDetteDemoc$year))-1
#N.samples = length(unique(PibDetteDemoc$country))
#PIB = matrix(PibDetteDemoc$PIB,N.samples,T+1)
#Dette = matrix(PibDetteDemoc$Dette,N.samples,T+1)
#Democratie = matrix(PibDetteDemoc$Democratie,N.samples,T+1)

#d = 2
#Y = array(0,c(T,N.samples,2))
#for (k in 1:N.samples) {
#   Y[,k,1] = diff(log(PIB[k,]))
#   Y[,k,2] = diff(log(Dette[k,]))
#}
#Democ = Democratie[,2:(T+1)] 
#theta.hh = init.theta.MSAR(Y,M=M,order=1,label="HH")
#res.hh = fit.MSAR(Y,theta.hh,verbose=TRUE,MaxIter=200)
#regime.hh = apply(res.hh$smoothedprob,c(1,2),which.max)

## Not run
# Fit Non Homogeneous (emission) MS-AR models - multivariate time series
#theta.hn = init.theta.MSAR(Y,M=M,order=1,label="HN",ncov.emis=1)
#theta.hn$A0 = res.hh$theta$A0
#theta.hn$A = res.hh$theta$A
#theta.hn$sigma = res.hh$theta$sigma
#theta.hn$transmat = res.hh$theta$transmat
#theta.hn$prior = res.hh$theta$prior
#Z = array(t(Democ[,2:T]),c(T,N.samples,1))
#res.hn = fit.MSAR(Y,theta.hn,verbose=TRUE,MaxIter=200,covar.emis=Z)

# Fit Non Homogeneous (transitions) MS-AR models - multivariate time series
#theta.nh = init.theta.MSAR(Y,M=M,order=1,label="NH",nh.transitions="gauss",ncov.trans=1)
#theta.nh$A0 = res.hh$theta$A0
#theta.nh$A = res.hh$theta$A
#theta.nh$sigma = res.hh$theta$sigma
#theta.nh$transmat = res.hh$theta$transmat
#theta.nh$prior = res.hh$theta$prior
#theta.nh$par.trans[1:2,1] = 10
#theta.nh$par.trans[3:4,1] = 0
#theta.nh$par.trans[,2] = 2
#Z = array(t(Democ[,2:T]),c(T,N.samples,1))
#res.nh = fit.MSAR(Y,theta.nh,verbose=TRUE,MaxIter=200,covar.trans=Z)



