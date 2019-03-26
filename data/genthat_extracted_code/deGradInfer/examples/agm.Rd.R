library(deGradInfer)


### Name: agm
### Title: Main function for adaptive gradient matching
### Aliases: agm

### ** Examples


dataTest <- LV_example_dataset$data
timeTest <- LV_example_dataset$time
noiseTest <- LV_example_dataset$noise

LV_func = function(t, X, params) {
	dxdt = cbind(
	  X[,1]*(params[1] - params[2]*X[,2]),
 	- X[,2]*(params[3] - params[4]*X[,1])
	)
	return(dxdt)
}

# Example run only; to achieve convergence the number of iterations and
# chains must be increased.
param.result = agm(data=dataTest,time=timeTest,noise.sd=0.31,ode.system=LV_func,
    numberOfParameters=4,temperMismatchParameter=TRUE,
    chainNum=4, maxIterations=150,originalSignalOnlyPositive=TRUE,
    logPrior="Gamma",defaultTemperingScheme="LB10")

print(param.result$posterior.mean)




