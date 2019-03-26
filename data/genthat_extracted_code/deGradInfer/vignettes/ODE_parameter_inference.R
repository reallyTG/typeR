## ----echo=FALSE----------------------------------------------------------
set.seed(10)

## ------------------------------------------------------------------------
testLogPrior <- function(params)
{
	return(c(dunif(params[1],0,10,log=TRUE),
		dgamma(params[2:3],shape=4,scale=0.5,log=TRUE),
		dchisq(params[4],2,log=TRUE)))
}

## ------------------------------------------------------------------------
LV_func <- function(t, X, params) {
	dxdt = cbind(
	  X[,1]*(params[1] - params[2]*X[,2]), # Prey
 	- X[,2]*(params[3] - params[4]*X[,1])  # Predators
	)
	return(dxdt)
}

## ------------------------------------------------------------------------
library('deSolve')

# Wrapper function
deSolve_LV_func = function(t,y,params) {
  list(LV_func(t,matrix(y,1,length(y)),params))
}

# Generate some data
test.times = seq(0,2,0.1)
test.data = ode(c(5,3), test.times, deSolve_LV_func, c(2,1,4,1))
test.data = test.data[,2:3] +
  rnorm(dim(test.data)[1]*2,0,0.1) # add some observational noise

## ------------------------------------------------------------------------
library('deGradInfer')

agm.result = agm(test.data,test.times,LV_func,4,noise.sd=0.1,
                 maxIterations=1000,chainNum=5)

print(agm.result$posterior.mean)

## ------------------------------------------------------------------------
library('ggplot2')

plotting.frame = data.frame(Param.Values=c(agm.result$posterior.samples), 
                            Param.Num=rep(1:4, each=dim(agm.result$posterior.samples)[1]))

ggplot(plotting.frame, aes(x=Param.Values, y=..scaled..)) +
  facet_wrap(~paste('Parameter', Param.Num), scales = 'free') + 
  geom_density() +
  labs(y='Scaled Density', x='Parameter Value') + 
  xlim(c(0,5))

## ------------------------------------------------------------------------
qplot(x=seq(25,1000,25), y=c(agm.result$ll), geom = 'line') + 
  labs(x='Iterations', y='Log-likelihood')
  


## ----eval=FALSE----------------------------------------------------------
#  agm.result = agm(test.data,test.times,LV_func,4,noise.sd=0.1,temperMismatchParameter=TRUE,
#      originalSignalOnlyPositive=TRUE,
#      logPrior="Gamma", defaultTemperingScheme="LB10")

## ----eval=FALSE----------------------------------------------------------
#  agm.result = agm(test.data,test.times,LV_func,4,noise.sd=0.1,temperMismatchParameter=TRUE,
#      originalSignalOnlyPositive=TRUE,logPrior="Gamma",
#      mismatchParameterValues=matrix(seq(0.01,1,length.out=20),nrow=20,ncol=2))

## ----eval=FALSE----------------------------------------------------------
#  agm.result = agm(test.data,test.times,LV_func,numberOfParameters=6,explicit=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # Function encoding the Vyshemirsky and Girolami ODE model 1.
#  VG_func <- function(t, X, params) {
#    MM <- ((params[5]*X[,5])/(params[6]+X[,5])) # Michaelis-Menten term
#  
#  
#    dxdt <- cbind( - params[1]*X[,1] - params[2]*X[,1]*X[,3] +
#                     params[3]*X[,4], # S
#                   params[1]*X[,1], # dS
#                   - params[2]*X[,1]*X[,3] + params[3]*X[,4] +
#                     MM, # R
#                   params[2]*X[,1]*X[,3] - params[3]*X[,4] -
#                     params[4]*X[,4], # RS
#                   params[4]*X[,4] - MM # Rpp
#  		   )
#  
#    return(dxdt)
#  }
#  
#  # Generate data
#  timeTest = c(0,1,2,4,5,7,10,15,20,30,40,50,60,80,100)
#  dataTest = ode(c(1,0,1,0,0), timeTest,
#                 function(t,y,params) list(VG_func(t,matrix(y,1,length(y)),params)), c(0.07,0.6,0.05,0.3,0.017,0.3))
#  dataTest = dataTest[,2:6] + rnorm(dim(dataTest)[1]*5,0,0.01)
#  
#  
#  # Run adaptive gradient matching
#  agm.result = agm(data=dataTest,time=timeTest,ode.system=VG_func, numberOfParameters=6)

## ---- eval=FALSE---------------------------------------------------------
#  # Remove the observations of the first variable
#  dataTest[,1] = NA
#  
#  # Run adaptive gradient matching
#  agm.result = agm(data=dataTest,time=timeTest,ode.system=VG_func, observedVariables=2:5, numberOfParameters=6)

