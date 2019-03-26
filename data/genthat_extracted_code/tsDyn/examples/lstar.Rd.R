library(tsDyn)


### Name: LSTAR
### Title: Logistic Smooth Transition AutoRegressive model
### Aliases: LSTAR lstar
### Keywords: ts

### ** Examples

#fit a LSTAR model. Note 'maxit': slow convergence
mod.lstar <- lstar(log10(lynx), m=2, mTh=c(0,1), control=list(maxit=3000))
mod.lstar

#fit a LSTAR model without a constant in both regimes. 
mod.lstar2 <- lstar(log10(lynx), m=1,  include="none")
mod.lstar2

#Note in example below that the initial grid search seems to be to narrow. 
# Extend it, and evaluate more values (slow!):
controls <- list(gammaInt=c(1,2000), nGamma=50)
mod.lstar3 <- lstar(log10(lynx), m=1,  include="none", starting.control=controls)
mod.lstar3

# a few methods for lstar:
summary(mod.lstar)
residuals(mod.lstar)
AIC(mod.lstar)
BIC(mod.lstar)
plot(mod.lstar)
predict(mod.lstar, n.ahead=5)



