library(compoisson)


### Name: com.mean
### Title: Computes Mean of the COM-Poisson Distribution
### Aliases: com.mean
### Keywords: models

### ** Examples

	data(insurance)
	model = com.fit(Lemaire);
	com.mean(model$lambda, model$nu);



