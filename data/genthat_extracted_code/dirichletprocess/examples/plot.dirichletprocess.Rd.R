library(dirichletprocess)


### Name: plot.dirichletprocess
### Title: Plot the Dirichlet process object
### Aliases: plot.dirichletprocess plot_dirichletprocess_univariate
###   plot_dirichletprocess_multivariate

### ** Examples

dp <- DirichletProcessGaussian(c(rnorm(50, 2, .2), rnorm(60)))
dp <- Fit(dp, 100)
plot(dp)

plot(dp, likelihood = TRUE, data_method = "hist",
     data_fill = rgb(.5, .5, .8, .6), data_bw = .3)




