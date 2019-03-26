library(VGAM)


### Name: rrvglm.control
### Title: Control Function for rrvglm()
### Aliases: rrvglm.control
### Keywords: models regression

### ** Examples

## Not run: 
##D set.seed(111)
##D pneumo <- transform(pneumo, let = log(exposure.time),
##D                             x3 = runif(nrow(pneumo)))  # x3 is random noise
##D fit <- rrvglm(cbind(normal, mild, severe) ~ let + x3,
##D               multinomial, data = pneumo, Rank = 1, Index.corner = 2)
##D constraints(fit)
##D vcov(fit)
##D summary(fit)
## End(Not run)



