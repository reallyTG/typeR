library(vcd)


### Name: rootogram
### Title: Rootograms
### Aliases: rootogram rootogram.default rootogram.goodfit
### Keywords: hplot

### ** Examples

## Simulated data examples:
dummy <- rnbinom(200, size = 1.5, prob = 0.8)
observed <- table(dummy)
fitted1 <- dnbinom(as.numeric(names(observed)),
                   size = 1.5, prob = 0.8) * sum(observed)
fitted2 <- dnbinom(as.numeric(names(observed)),
                   size = 2, prob = 0.6) * sum(observed)
rootogram(observed, fitted1)
rootogram(observed, fitted2)

## Real data examples:
data("HorseKicks")
HK.fit <- goodfit(HorseKicks)
summary(HK.fit)
plot(HK.fit)
## or equivalently
rootogram(HK.fit)

data("Federalist")
F.fit <- goodfit(Federalist, type = "nbinomial")
summary(F.fit)
plot(F.fit)

## (Pearson) residual-based shading
data("Federalist")
Fed_fit0 <- goodfit(Federalist, type = "poisson")
plot(Fed_fit0, shade = TRUE)



