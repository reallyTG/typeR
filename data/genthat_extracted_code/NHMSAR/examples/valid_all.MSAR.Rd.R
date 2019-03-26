library(NHMSAR)


### Name: valid_all.MSAR
### Title: Statistics plotting for validation of MSAR models
### Aliases: valid_all.MSAR
### Keywords: MSAR model validation

### ** Examples

data(meteo.data)
data = array(meteo.data$temperature,c(31,41,1)) 
k = 40
plot(data[,k,1],typ="l",xlab=("time (days)"),ylab=("temperature (degrees C)"))
T = dim(data)[1]
N.samples = dim(data)[2]
d = dim(data)[3]
# Fit Homogeneous MS-AR models
M = 2
order = 1
theta.init = init.theta.MSAR(data,M=M,order=order,label="HH") 
mod.hh = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=10)
# Simulation
yT = 31
Bsim = 10
Ksim = Bsim*N.samples
Y0 = array(data[1:2,sample(1:dim(data)[2],Ksim,replace=T),],c(2,Ksim,1))
Y.sim = simule.nh.MSAR(mod.hh$theta,Y0 = Y0,T,N.samples = Ksim) 
valid_all.MSAR(data,Y.sim$Y)



