library(vcd)


### Name: goodfit
### Title: Goodness-of-fit Tests for Discrete Data
### Aliases: goodfit summary.goodfit plot.goodfit predict.goodfit
###   fitted.goodfit residuals.goodfit print.goodfit
### Keywords: category

### ** Examples

## Simulated data examples:
dummy <- rnbinom(200, size = 1.5, prob = 0.8)
gf <- goodfit(dummy, type = "nbinomial", method = "MinChisq")
summary(gf)
plot(gf)

dummy <- rbinom(100, size = 6, prob = 0.5)
gf1 <- goodfit(dummy, type = "binomial", par = list(size = 6))
gf2 <- goodfit(dummy, type = "binomial", par = list(prob = 0.6, size = 6))
summary(gf1)
plot(gf1)
summary(gf2)
plot(gf2)

## Real data examples:
data("HorseKicks")
HK.fit <- goodfit(HorseKicks)
summary(HK.fit)
plot(HK.fit)

data("Federalist")
## try geometric and full negative binomial distribution
F.fit <- goodfit(Federalist, type = "nbinomial", par = list(size = 1))
F.fit2 <- goodfit(Federalist, type = "nbinomial")
summary(F.fit)
summary(F.fit2)
plot(F.fit)
plot(F.fit2)



