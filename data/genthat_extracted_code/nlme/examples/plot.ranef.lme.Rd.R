library(nlme)


### Name: plot.ranef.lme
### Title: Plot a ranef.lme Object
### Aliases: plot.ranef.lme
### Keywords: models

### ** Examples

## Not run: 
##D fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
##D plot(ranef(fm1))
##D fm1RE <- ranef(fm1, aug = TRUE)
##D plot(fm1RE, form = ~ Sex)
##D plot(fm1RE, form = age ~ Sex)
## End(Not run)



