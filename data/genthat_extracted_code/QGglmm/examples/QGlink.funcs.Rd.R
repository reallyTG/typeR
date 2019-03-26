library(QGglmm)


### Name: QGlink.funcs
### Title: List of functions according to a distribution and a link
###   function
### Aliases: QGlink.funcs

### ** Examples

## Getting the functions for a Poisson.log model
QGlink.funcs("Poisson.log")
# Note that because the variance is equal to the mean in a Poisson distribution
# and the derivative of exp is exp
# all functions are the same!

## Getting the functions for a binom1.probit model
QGlink.funcs("binom1.probit")

## The function QGparams automatically computes these functions
QGparams(mu = 0, var.p = 2, var.a = 1, model = "binom1.logit")
# Hence this is the same as using the custom.model argument with QGlink.funcs
QGparams(mu = 0, var.p = 2, var.a = 1, custom.model = QGlink.funcs("binom1.logit"))

## We can create our own custom set of functions
# Let's create a custom model exactly identical to QGlink.funcs("binom1.logit")
custom <- list(inv.link = function(x){plogis(x)},
               var.func = function(x){plogis(x) * (1 - plogis(x))},
               d.inv.link = function(x){dlogis(x)})
    
QGparams(mu = 0, var.p = 2, var.a = 1, custom.model = custom)



