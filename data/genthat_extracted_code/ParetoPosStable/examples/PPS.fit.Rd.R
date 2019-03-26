library(ParetoPosStable)


### Name: PPS.fit
### Title: Fitting the Pareto Positive Stable (PPS) distribution
### Aliases: PPS.fit

### ** Examples

data(turkey)
fit <- PPS.fit(turkey$Pop2000)
print(fit)
coef(fit)
se(fit, k = 100, parallel = FALSE)
logLik(fit)
par(mfrow=c(2,2))
plot(fit)
GoF(fit, k = 100, parallel = FALSE)



