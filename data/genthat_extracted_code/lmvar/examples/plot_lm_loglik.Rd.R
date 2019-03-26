library(lmvar)


### Name: plot_lm_loglik
### Title: Plot of the log-likelihood surface of a lineair model
### Aliases: plot_lm_loglik

### ** Examples

## Not run: 
##D 
##D # Carry out a linear regression with the 'iris' data set
##D fit = lm( Petal.Length ~ Species, data = iris, x = TRUE, y = TRUE)
##D X = fit$x
##D y = fit$y
##D 
##D # We center the plot at the maximum-likelihood
##D beta_or = coef(fit)
##D 
##D # Plot the maximum log-likelihood
##D lmvar:::plot_lm_loglik( y, X, beta_or = beta_or, beta_x = "(Intercept)",
##D                         beta_y = "Speciesversicolor")
##D 
##D # Plot against the two species
##D lmvar:::plot_lm_loglik( y, X, beta_or = beta_or, beta_x = "Speciesversicolor",
##D                         beta_y = "Speciesvirginica")
##D 
##D # Increase the resolution
##D lmvar:::plot_lm_loglik( y, X, beta_or = beta_or, beta_x = "Speciesversicolor",
##D                         beta_y = "Speciesvirginica", plot_points = 40)
##D 
##D # Remove the intercept term from the model matrix and fit again
##D XX = X[,-1]
##D fit = lm( y ~ . - 1, data = as.data.frame(XX))
##D 
##D # Estimate the effect of adding an intercept term in a quadratic approximation and compare
##D # with exact result
##D beta_or = c( 0, coef(fit))
##D lmvar:::plot_lm_loglik( y, X, beta_or = beta_or, beta_x = 1, beta_y = "Speciesversicolor",
##D                         add_qa = TRUE, plot_points = 40, plot_width = 5)
##D 
##D # Note that in the last case the quadratic approximation has no maximum. Hence the beta for
##D # "Speciesvirginica" is kept at beta_or[3] in the calculation of the surface of the
##D # quadratic approximation.
## End(Not run)



