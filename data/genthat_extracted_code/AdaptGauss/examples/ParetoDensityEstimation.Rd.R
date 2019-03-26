library(AdaptGauss)


### Name: ParetoDensityEstimation
### Title: Pareto Density Estimation
### Aliases: ParetoDensityEstimation

### ** Examples

			data = c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
			pdeVal        <- ParetoDensityEstimation(data)
			plot(pdeVal$kernels,pdeVal$paretoDensity,type='l',xaxs='i',
			yaxs='i',xlab='Data',ylab='PDE') 
  			



