library(compoisson)


### Name: com.log.density
### Title: Computes the Log PMF of the COM-Poisson Distribution
### Aliases: com.log.density
### Keywords: models

### ** Examples

	data(insurance);
	fit = com.fit(Lemaire);
	com.log.density(0, fit$lambda, fit$nu, fit$z);



