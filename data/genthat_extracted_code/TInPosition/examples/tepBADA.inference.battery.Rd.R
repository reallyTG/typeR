library(TInPosition)


### Name: tepBADA.inference.battery
### Title: Barycentric Discriminant Analysis Inference Battery
### Aliases: tepBADA.inference.battery
### Keywords: multivariate

### ** Examples

	data(bada.wine)
	data<-bada.wine$data
	design <- bada.wine$design
	bada.res <- 
		tepBADA.inference.battery(data,scale=FALSE,DESIGN=design,
			make_design_nominal=FALSE,test.iters=50)



