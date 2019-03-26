library(compoisson)


### Name: dcom
### Title: The COM-Poisson Distribution
### Aliases: dcom rcom
### Keywords: models

### ** Examples

	data(insurance);
	fit = com.fit(Lemaire);
	dcom(0, fit$lambda, fit$nu, fit$z);
	r = rcom(10, fit$lambda, fit$nu);



