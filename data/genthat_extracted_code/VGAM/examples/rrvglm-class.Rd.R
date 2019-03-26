library(VGAM)


### Name: rrvglm-class
### Title: Class "rrvglm"
### Aliases: rrvglm-class
### Keywords: classes

### ** Examples

## Not run: 
##D  # Rank-1 stereotype model of Anderson (1984)
##D pneumo <- transform(pneumo, let = log(exposure.time),
##D                             x3  = runif(nrow(pneumo)))  # x3 is unrelated
##D fit <- rrvglm(cbind(normal, mild, severe) ~ let + x3,
##D               multinomial, data = pneumo, Rank = 1)
##D Coef(fit)
## End(Not run)



