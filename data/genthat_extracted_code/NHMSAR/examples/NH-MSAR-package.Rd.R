library(NHMSAR)


### Name: NH-MSAR-package
### Title: (Non) Homogeneous Markov switching autoregressive model
### Aliases: NH-MSAR-package NH-MSAR
### Keywords: package

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
regimes.plot.MSAR(mod.hh,data,ylab="temperatures") 
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
## End (not run)



