library(dirichletprocess)


### Name: LikelihoodFunction
### Title: The Likelihood function of a Dirichlet process object.
### Aliases: LikelihoodFunction

### ** Examples

y <- rnorm(10)
dp <- DirichletProcessGaussian(y)
dp <- Fit(dp, 5)
f <- LikelihoodFunction(dp)
plot(f(-2:2))




