library(ordinal)


### Name: confint.clm2
### Title: Confidence intervals and profile likelihoods for parameters in
###   cumulative link models
### Aliases: confint.clm2 confint.profile.clm2 profile.clm2
###   plot.profile.clm2
### Keywords: internal

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

## More manageable data set:
(tab26 <- with(soup, table("Product" = PROD, "Response" = SURENESS)))
dimnames(tab26)[[2]] <- c("Sure", "Not Sure", "Guess", "Guess", "Not Sure", "Sure")
dat26 <- expand.grid(sureness = as.factor(1:6), prod = c("Ref", "Test"))
dat26$wghts <- c(t(tab26))

m1 <- clm2(sureness ~ prod, scale = ~prod, data = dat26,
          weights = wghts, link = "logistic")

## profile
pr1 <- profile(m1)
par(mfrow = c(2, 2))
plot(pr1)

m9 <- update(m1, link = "log-gamma")
pr9 <- profile(m9, whichL = numeric(0), whichS = numeric(0))
par(mfrow = c(1, 1))
plot(pr9)

plot(pr9, Log=TRUE, relative = TRUE)
plot(pr9, Log=TRUE, relative = TRUE, ylim = c(-4, 0))
plot(pr9, Log=TRUE, relative = FALSE)

## confint
confint(pr9)
confint(pr1)

## Extend example from polr in package MASS:
## Fit model from polr example:
if(require(MASS)) {
    fm1 <- clm2(Sat ~ Infl + Type + Cont, scale = ~ Cont, weights = Freq,
                data = housing)
    pr1 <- profile(fm1)
    confint(pr1)
    par(mfrow=c(2,2))
    plot(pr1)
}




