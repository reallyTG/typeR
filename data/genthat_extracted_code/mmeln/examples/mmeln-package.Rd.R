library(mmeln)


### Name: mmeln-package
### Title: Estimation of Multinormal Mixture Distribution
### Aliases: mmeln.package
### Keywords: package

### ** Examples

### load an example.
data(exY)

### estimation of the parameters of the mixture.

temps <- factor(1:3)
mmeln1 <- mmeln(Y, G = 2, form.loc = ~temps-1, form.mel = ~1, cov = "CS")
mix1 <- estim(mmeln1, mu = list(rep(1,3), rep(2,3)), tau = c(0),
              sigma = list(c(1,.6), c(1,.6)), iterlim = 100,tol = 1e-6)
mix1
anova(mix1)
plot(mix1,main="Mixture of multivariate normal")



