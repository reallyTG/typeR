library(statmod)


### Name: Digamma
### Title: Digamma generalized linear model family
### Aliases: Digamma canonic.digamma d2cumulant.digamma
###   unitdeviance.digamma cumulant.digamma meanval.digamma varfun.digamma
### Keywords: models

### ** Examples

# Test for log-linear dispersion trend in gamma regression
y <- rchisq(20,df=1)
x <- 1:20
out.gam <- glm(y~x,family=Gamma(link="log"))
d <- residuals(out.gam)^2
out.dig <- glm(d~x,family=Digamma(link="log"))
summary(out.dig,dispersion=2)



