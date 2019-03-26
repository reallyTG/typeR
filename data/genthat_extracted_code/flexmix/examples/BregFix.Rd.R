library(flexmix)


### Name: BregFix
### Title: Artificial Example for Binomial Regression
### Aliases: BregFix
### Keywords: datasets

### ** Examples

data("BregFix", package = "flexmix")
Model <- FLXMRglmfix(family="binomial",
                     nested = list(formula = c(~x, ~0), k = c(2, 1)))
Conc <- FLXPmultinom(~w)
FittedBin <- initFlexmix(cbind(yes, no) ~ 1, data = BregFix,
                         k = 3, model = Model, concomitant = Conc)
summary(FittedBin)



