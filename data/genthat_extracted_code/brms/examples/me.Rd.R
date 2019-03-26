library(brms)


### Name: me
### Title: Predictors with Measurement Error in 'brms' Models
### Aliases: me

### ** Examples

## Not run: 
##D # sample some data
##D N <- 100
##D dat <- data.frame(
##D   y = rnorm(N), x1 = rnorm(N), 
##D   x2 = rnorm(N), sdx = abs(rnorm(N, 1))
##D  )
##D # fit a simple error-in-variables model 
##D fit1 <- brm(y ~ me(x1, sdx) + me(x2, sdx), data = dat, 
##D            save_mevars = TRUE)
##D summary(fit1)
##D 
##D # turn off modeling of correlations
##D bform <- bf(y ~ me(x1, sdx) + me(x2, sdx)) + set_mecor(FALSE)
##D fit2 <- brm(bform, data = dat, save_mevars = TRUE)
##D summary(fit2)
## End(Not run) 




