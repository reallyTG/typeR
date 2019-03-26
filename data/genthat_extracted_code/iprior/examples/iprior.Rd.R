library(iprior)


### Name: iprior
### Title: Fit an I-prior regression model
### Aliases: iprior iprior.default iprior.formula iprior.ipriorKernel
###   iprior.ipriorMod

### ** Examples


# Formula based input
(mod.stackf <- iprior(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.,
                      data = stackloss))
mod.toothf <- iprior(len ~ supp * dose, data = ToothGrowth)
summary(mod.toothf)

# Non-formula based input
mod.stacknf <- iprior(y = stackloss$stack.loss,
                      Air.Flow = stackloss$Air.Flow,
                      Water.Temp = stackloss$Water.Temp,
                      Acid.Conc. = stackloss$Acid.Conc.)
mod.toothnf <- iprior(y = ToothGrowth$len, ToothGrowth$supp, ToothGrowth$dose,
                      interactions = "1:2")

# Formula based model option one.lam = TRUE
# Sets a single scale parameter for all variables
modf <- iprior(stack.loss ~ ., data = stackloss, one.lam = TRUE)
modnf <- iprior(y = stackloss$stack.loss, X = stackloss[1:3])
all.equal(coef(modnf), coef(modnf))  # both models are equivalent

# Fit models using different kernels
dat <- gen_smooth(n = 100)
mod <- iprior(y ~ X, dat, kernel = "fbm")  # Hurst = 0.5 (default)
mod <- iprior(y ~ X, dat, kernel = "poly3")  # polynomial degree 3

# Fit models using various estimation methods
mod1 <- iprior(y ~ X, dat)
mod2 <- iprior(y ~ X, dat, method = "em")
mod3 <- iprior(y ~ X, dat, method = "canonical")
mod4 <- iprior(y ~ X, dat, method = "mixed")
mod5 <- iprior(y ~ X, dat, method = "fixed", lambda = coef(mod1)[1],
               psi = coef(mod1)[2])
c(logLik(mod1), logLik(mod2), logLik(mod3), logLik(mod4),
  logLik(mod5))

## Not run: 
##D 
##D # For large data sets, it is worth trying the Nystrom method
##D mod <- iprior(y ~ X, gen_smooth(5000), kernel = "se", nystrom = 50,
##D               est.lengthscale = TRUE)  # a bit slow
##D plot_fitted(mod, ci = FALSE)
## End(Not run)




