library(NHMSAR)


### Name: init.theta.MSAR (NH-MSAR)
### Title: Initialisation function for MSAR model fitting
### Aliases: init.theta.MSAR
### Keywords: initialisation MSAR model fitting

### ** Examples


data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]

# Fit Homogeneous MS-AR models
M = 2
order = 2
theta.init = init.theta.MSAR(data,M=M,order=order,label="HH") 
mod.hh = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=10)
regimes.plot.MSAR(mod.hh,data,ylab="temperatures") 

## Not run
# Fit Non Homogeneous MS-AR models
#theta.init = init.theta.MSAR(data,M=M,order=order,label="NH",nh.transitions="gauss")
#attributes(theta.init)
#mod.nh = fit.MSAR(array(data[2:T,,],c(T-1,N.samples,1)),theta.init,verbose=TRUE,MaxIter=50,
#covar.trans=array(data[1:(T-1),,],c(T-1,N.samples,1)))
#regimes.plot.MSAR(mod.nh,data,ex=40,ylab="temperature (deg. C)")

## Not run
# Fit Non Homogeneous MS-AR models to lynx data
#data(lynx)
#data = array(lynx,c(length(lynx),1,1))
#theta.init = init.theta.MSAR(data,M=2,order=2,label="NH",nh.transitions="logistic")
#attributes(theta.init)
#mod.lynx = fit.MSAR(array(data[2:T,,],c(T-1,1,1)),theta.init,verbose=TRUE,MaxIter=200,
#covar.trans=array(data[1:(T-1),,],c(T-1,1,1)))
#regimes.plot.MSAR(mod.lynx,data,ylab="Captures number")



