library(memisc)


### Name: withSE
### Title: Add Alternative Variance Estimates to Models Estimates
### Aliases: withSE withVCov withVCov.lm vcov.withVCov summary.withVCov
###   summary.withVCov.lm

### ** Examples

## Generate poisson regression relationship
x <- sin(1:100)
y <- rpois(100, exp(1 + x))
## compute usual covariance matrix of coefficient estimates
fm <- glm(y ~ x, family = poisson)

library(sandwich)
fmo <- withVCov(fm,vcovOPG)
vcov(fm)
vcov(fmo)

summary(fm)
summary(fmo)

mtable(Default=fm,
       OPG=withSE(fm,"OPG"),
       summary.stats=c("Deviance","N")
       )

vo <- vcovOPG(fm)

mtable(Default=fm,
       OPG=withSE(fm,vo),
       summary.stats=c("Deviance","N")
       )



