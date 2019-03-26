library(flexmix)


### Name: NregFix
### Title: Artificial Example for Normal Regression
### Aliases: NregFix
### Keywords: datasets

### ** Examples

data("NregFix", package = "flexmix")
library("lattice")
xyplot(y ~ x1 | x2 * w, data = NregFix, groups = class)
Model <- FLXMRglmfix(~ 1, fixed = ~ x2, 
                     nested = list(k = c(2, 1),
                     formula = c(~x1, ~0)))
fittedModel <- initFlexmix(y ~ 1, model = Model, data = NregFix, k = 3,
                           concomitant = FLXPmultinom(~ w), nrep = 5)
fittedModel



