library(compoisson)


### Name: com.compute.z
### Title: Compute COM-Poisson Normalizing Constant
### Aliases: com.compute.z com.compute.log.z
### Keywords: models

### ** Examples

	data(insurance);
	fit = com.fit(Lemaire);
	z = com.compute.z(fit$lambda, fit$nu);



