library(ordinal)


### Name: confint
### Title: Confidence intervals and profile likelihoods for parameters in
###   cumulative link models
### Aliases: confint.clm confint.profile.clm profile.clm plot.profile.clm
### Keywords: models

### ** Examples


## Accurate profile likelihood confidence intervals compared to the
## conventional Wald intervals:
fm1 <- clm(rating ~ temp * contact, data = wine)
confint(fm1) ## type = "profile"
confint(fm1, type = "Wald")
pr1 <- profile(fm1)
confint(pr1)

## plotting the profiles:
par(mfrow = c(2, 2))
plot(pr1, root = TRUE) ## check for linearity
par(mfrow = c(2, 2))
plot(pr1)
par(mfrow = c(2, 2))
plot(pr1, approx = TRUE)
par(mfrow = c(2, 2))
plot(pr1, Log = TRUE)
par(mfrow = c(2, 2))
plot(pr1, Log = TRUE, relative = FALSE)
## Not likely to be useful but allowed for completeness:
par(mfrow = c(2, 2))
plot(pr1, Log = FALSE, relative = FALSE)

## Example from polr in package MASS:
## Fit model from polr example:
if(require(MASS)) {
    fm1 <- clm(Sat ~ Infl + Type + Cont, weights = Freq,
               data = housing)
    pr1 <- profile(fm1)
    confint(pr1)
    par(mfrow=c(2,2))
    plot(pr1)
}




