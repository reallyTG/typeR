library(TInPosition)


### Name: tinGraphs
### Title: tinGraphs: TInPosition plotting function
### Aliases: tinGraphs
### Keywords: multivariate graphs misc

### ** Examples

	#this is for TExPosition's iris data
	data(ep.iris)
	data <- ep.iris$data
	design <- ep.iris$design
	bada.iris <- 
		tepBADA.inference.battery(
		data,DESIGN=design,
		make_design_nominal=FALSE,test.iters=50)		
	tinGraphs(bada.iris,x_axis=1,y_axis=2,biplots=TRUE)



