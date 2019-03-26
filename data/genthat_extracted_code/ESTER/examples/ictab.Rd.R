library(ESTER)


### Name: ictab
### Title: Computes Akaike weights or pseudo-BMA weights for a set of
###   models
### Aliases: ictab

### ** Examples

library(ESTER)
data(mtcars)
mod1 <- lm(mpg ~ cyl, mtcars)
mod2 <- lm(mpg ~ cyl + vs, mtcars)
mod3 <- lm(mpg ~ cyl + vs + I(vs^2), mtcars)
mod4 <- lm(mpg ~ cyl * vs, mtcars)
mods <- list(mod1 = mod1, mod2 = mod2, mod3 = mod3, mod4 = mod4)
ictab(mods, aic)
ictab(mods, bic)

## Not run: 
##D library(brms)
##D mod1 <- brm(mpg ~ cyl, mtcars)
##D mod2 <- brm(mpg ~ cyl + vs, mtcars)
##D mods <- list(m1 = mod1, m2 = mod2)
##D ictab(mods, LOO, reloo = TRUE, k_threshold = 0.6, cores = 2)
## End(Not run)




