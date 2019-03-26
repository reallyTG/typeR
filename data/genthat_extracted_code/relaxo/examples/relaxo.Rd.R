library(relaxo)


### Name: relaxo
### Title: Relaxed Lasso (relaxo)
### Aliases: relaxo
### Keywords: models

### ** Examples

	data(diabetes)

## Center and scale variables
   	x <- scale(diabetes$x)
	y <- as.numeric(scale(diabetes$y))
	
## Compute "Relaxed Lasso" solution and plot results
 	object <- relaxo(x,y)
	plot(object)   
	
## Compute cross-validated solution with optimal 
## predictive performance and print relaxation parameter phi and 
## penalty parameter lambda of the found solution
	cvobject <- cvrelaxo(x,y)
	print(cvobject$phi)
	print(cvobject$lambda)

## Compute fitted values and plot them versus actual values     
	fitted.values <- predict(cvobject)
	plot(fitted.values,y)
	abline(c(0,1))




