library(dirichletprocess)


### Name: PosteriorFunction
### Title: Generate the posterior function of the Dirichlet function
### Aliases: PosteriorFunction

### ** Examples


y <- rnorm(10)
dp <- DirichletProcessGaussian(y)
dp <- Fit(dp, 5)
postFuncDraw <- PosteriorFunction(dp)
plot(-3:3, postFuncDraw(-3:3))




