library(spaMM)


### Name: HLfit
### Title: Fit mixed models with given correlation matrix
### Aliases: HLfit Beta-distribution-random-effects Beta
### Keywords: model

### ** Examples

data("wafers")
## Gamma GLMM with log link
HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          resid.model = ~ X3+I(X3^2) ,data=wafers)
## Gamma - inverseGamma HGLM with log link
HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          HLmethod="HL(1,1)",rand.family=inverse.Gamma(log),
          resid.model = ~ X3+I(X3^2) ,data=wafers)



