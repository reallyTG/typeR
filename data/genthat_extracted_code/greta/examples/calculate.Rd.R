library(greta)


### Name: calculate
### Title: calculate greta arrays given fixed values
### Aliases: calculate

### ** Examples

## Not run: 
##D 
##D # define a variable greta array, and another that is calculated from it
##D # then calculate what value y would take for different values of x
##D x <- normal(0, 1, dim = 3)
##D a <- lognormal(0, 1)
##D y <- sum(x ^ 2) + a
##D calculate(y, list(x = c(0.1, 0.2, 0.3), a = 2))
##D 
##D # if the greta array only depends on data,
##D # you can pass an empty list to values (this is the default)
##D x <- ones(3, 3)
##D y <- sum(x)
##D calculate(y)
##D 
##D # define a model
##D alpha <- normal(0, 1)
##D beta <- normal(0, 1)
##D sigma <- lognormal(1, 0.1)
##D mu <- alpha + iris$Petal.Length * beta
##D distribution(iris$Petal.Width) <- normal(mu, sigma)
##D m <- model(alpha, beta, sigma)
##D 
##D # calculate intermediate greta arrays, given some parameter values
##D calculate(mu[1:5], list(alpha = 1, beta = 2, sigma = 0.5))
##D calculate(mu[1:5], list(alpha = -1, beta = 0.2, sigma = 0.5))
##D 
##D 
##D # fit the model then calculate samples at a new greta array
##D draws <- mcmc(m, n_samples = 500)
##D petal_length_plot <- seq(min(iris$Petal.Length),
##D                          max(iris$Petal.Length),
##D                          length.out = 100)
##D mu_plot <- alpha + petal_length_plot * beta
##D mu_plot_draws <- calculate(mu_plot, draws)
##D 
##D # plot the draws
##D mu_est <- colMeans(mu_plot_draws[[1]])
##D plot(mu_est ~ petal_length_plot, type = "n",
##D      ylim = range(mu_plot_draws[[1]]))
##D apply(mu_plot_draws[[1]], 1, lines,
##D       x = petal_length_plot, col = grey(0.8))
##D lines(mu_est ~ petal_length_plot, lwd = 2)
## End(Not run)





