library(OpenMx)


### Name: mxComputeSimAnnealing
### Title: Optimization using generalized simulated annealing
### Aliases: mxComputeSimAnnealing MxComputeSimAnnealing-class

### ** Examples

library(OpenMx)
m1 <- mxModel(
	"poly22", # Eqn 22 from Tsallis & Stariolo (1996)
	mxMatrix(type='Full', values=runif(4, min=-1e6, max=1e6),
		ncol=1, nrow=4, free=TRUE, name='x'),
	mxAlgebra(sum((x*x-8)^2) + 5*sum(x) + 57.3276, name="fit"),
	mxFitFunctionAlgebra('fit'),
	mxComputeSimAnnealing())

m1 <- mxRun(m1)
summary(m1)



