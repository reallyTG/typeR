library(spaMM)


### Name: negbin
### Title: Family function for GLMs and mixed models with negative binomial
###   and zero-truncated negative binomial response.
### Aliases: negbin Tnegbin
### Keywords: models regression

### ** Examples

## Fitting negative binomial model with estimated scale parameter:
data("scotlip")
fitme(cases~I(prop.ag/10)+offset(log(expec)),family=negbin(), data=scotlip)
negfit <- fitme(I(1+cases)~I(prop.ag/10)+offset(log(expec)),family=Tnegbin(), data=scotlip)
simulate(negfit,nsim=3)



