library(car)


### Name: compareCoefs
### Title: Print estimated coefficients and their standard errors in a
###   table for several regression models.
### Aliases: compareCoefs
### Keywords: print

### ** Examples

mod1 <- lm(prestige ~ income + education, data=Duncan)
mod2 <- update(mod1, subset=-c(6,16))
mod3 <- update(mod1, . ~ . + type)
mod4 <- update(mod1, . ~ . + I(income + education)) # aliased coef.
compareCoefs(mod1)
compareCoefs(mod1, mod2, mod4)
compareCoefs(mod1, mod2, mod3, zvals=TRUE, pvals=TRUE)
compareCoefs(mod1, mod2, se=FALSE)
compareCoefs(mod1, mod1, vcov.=list(vcov, hccm))



