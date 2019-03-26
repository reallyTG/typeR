library(pim)


### Name: pim
### Title: Fitting a Probabilistic Index Model
### Aliases: pim

### ** Examples

data('FEVData')
# The most basic way to use the function
Model <- pim(FEV~ Smoke*Sex , data=FEVData)

# A model with intercept
# The argument xscalm is passed to nleqslv via pim.fit and estimator.nleqslv
# By constructing the estimator functions wisely, you can control most of
# the fitting process from the pim() function.
data('EngelData')
Model2 <- pim(foodexp ~ income + 1, data=EngelData,
   compare="all",
   xscalm = 'auto')

# A marginal model
# It makes sense to use the identity link in combination with the 
# score estimator for the variance-covariance matrix
data('DysData')
Model3 <- pim(SPC_D2 ~ out, data = DysData,
  model = 'marginal', link = 'identity',
  vcov.estim = score.vcov)

# A Model using logical comparisons, this is also possible!
# Model the chance that both observations have a different
# outcome in function of whether they had a different Chemo treatment
Model6 <- pim(P(L(out) != R(out)) ~ I(L(Chemo) != R(Chemo)),
   data=DysData,
   compare="all")

# Implementation of the friedman test in the context of a pim
# warpbreaks data where we consider tension as a block
# To do so, you provide the argument compare with a custom 
# set of comparisons
data(warpbreaks)
wb <- aggregate(warpbreaks$breaks,
                by = list(w = warpbreaks$wool,
                          t = warpbreaks$tension),
                FUN = mean)
comp <- expand.grid(1:nrow(wb), 1:nrow(wb))
comp <- comp[wb$t[comp[,1]] == wb$t[comp[,2]],] # only compare within blocks
m <- pim(x ~ w, data = wb, compare = comp, link = "identity",  vcov.estim = score.vcov)
summary(m)
friedman.test(x ~ w | t, data = wb)
## Not run: 
##D # This illustrates how a standard model is actually built in a pim contex
##D Model4 <- pim(PO(L(Height),R(Height)) ~ I(R(Age) - L(Age)) + I(R(Sex) - L(Sex)),
##D data=FEVData, 
##D estim = "estimator.BB")
##D # is the same as
##D Model5 <- pim(Height ~ Age + Sex, data = FEVData, estim = "estimator.BB")
##D summary(Model4)
##D summary(Model5)
## End(Not run)



