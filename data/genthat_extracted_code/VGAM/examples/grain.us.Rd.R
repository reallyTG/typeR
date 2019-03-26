library(VGAM)


### Name: grain.us
### Title: Grain Prices Data in USA
### Aliases: grain.us
### Keywords: datasets

### ** Examples

## Not run: 
##D cgrain <- scale(grain.us, scale = FALSE)  # Center the time series only
##D fit <- vglm(cgrain ~ 1, rrar(Rank = c(4, 1)),
##D             epsilon = 1e-3, stepsize = 0.5, trace = TRUE, maxit = 50)
##D summary(fit)
## End(Not run)



