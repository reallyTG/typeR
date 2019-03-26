library(COUNT)


### Name: ships
### Title: ships
### Aliases: ships
### Keywords: datasets

### ** Examples

data(ships)
glmshp <- glm(accident ~ op + co.70.74 + co.75.79 + offset(log(service)),
              family=poisson, data=ships)
summary(glmshp)
exp(coef(glmshp))
library(MASS)
glmshnb <- glm.nb(accident ~ op + co.70.74 + co.75.79 + offset(log(service)),
                   data=ships)
summary(glmshnb)
exp(coef(glmshnb))
## Not run: 
##D library(gee)
##D shipgee <- gee(accident ~ op + co.70.74 + co.75.79 + offset(log(service)),
##D               data=ships, family=poisson, corstr="exchangeable", id=ship)
##D summary(shipgee)
## End(Not run)



