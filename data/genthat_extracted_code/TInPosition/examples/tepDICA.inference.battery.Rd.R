library(TInPosition)


### Name: tepDICA.inference.battery
### Title: Discriminant Correspondence Analysis Inference Battery
### Aliases: tepDICA.inference.battery
### Keywords: multivariate

### ** Examples

	data(dica.wine)
	data<-dica.wine$data
	design<-dica.wine$design
	dica.res <- 
		tepDICA.inference.battery(data,DESIGN=design,
		make_design_nominal=FALSE,test.iters=50)



