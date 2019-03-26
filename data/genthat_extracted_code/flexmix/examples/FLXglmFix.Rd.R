library(flexmix)


### Name: FLXMRglmfix
### Title: FlexMix Interface to GLMs with Fixed Coefficients
### Aliases: FLXMRglmfix FLXglmFix
### Keywords: regression models

### ** Examples

data("NPreg", package = "flexmix")
ex <- flexmix(yn ~ x | id2, data = NPreg, k = 2,
              cluster = NPreg$class,
              model = FLXMRglm(yn ~ . + I(x^2)))
ex.fix <- flexmix(yn ~ x | id2, data = NPreg,
                  cluster = posterior(ex),
                  model = FLXMRglmfix(nested = list(k = c(1, 1),
                                      formula = c(~0, ~I(x^2)))))
summary(refit(ex))
## Not run: 
##D summary(refit(ex.fix))
## End(Not run)



