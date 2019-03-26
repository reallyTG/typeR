library(TExPosition)


### Name: tepGraphs
### Title: tepGraphs: TExPosition plotting function
### Aliases: tepGraphs
### Keywords: multivariate graphs misc

### ** Examples

	#this is for TExPosition's iris data
	data(ep.iris)
	bada.iris <- tepBADA(ep.iris$data,DESIGN=ep.iris$design,make_design_nominal=FALSE)
	#there are only 2 components, not 3.		
	bada.iris.plotting.data.biplot <- tepGraphs(bada.iris,x_axis=1,y_axis=2,biplots=TRUE)



