library(bamlss)


### Name: coef.bamlss
### Title: Extract BAMLSS Coefficients
### Aliases: coef.bamlss confint.bamlss
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Simulate data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   num ~ s(x1) + s(x2) + s(x3),
##D   sigma ~ s(x1) + s(x2) + s(x3)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Extract coefficients based on MCMC samples.
##D coef(b)
##D 
##D ## Now only the mean.
##D coef(b, FUN = mean)
##D 
##D ## As list without the full names.
##D coef(b, FUN = mean, list = TRUE, full.names = FALSE)
##D 
##D ## Coefficients only for "mu".
##D coef(b, model = "mu")
##D 
##D ## And "s(x2)".
##D coef(b, model = "mu", term = "s(x2)")
##D 
##D ## With optimizer parameters.
##D coef(b, model = "mu", term = "s(x2)", parameters = TRUE)
##D 
##D ## Only parameteric part.
##D coef(b, sterms = FALSE, hyper.parameters = FALSE)
##D 
##D ## For sigma.
##D coef(b, model = "sigma", sterms = FALSE,
##D   hyper.parameters = FALSE)
##D 
##D ## 95 perc. credible interval based on samples.
##D confint(b)
## End(Not run)



