library(rsq)


### Name: simglm
### Title: Simulate Data from Generalized Linear Models
### Aliases: simglm

### ** Examples

# Poisson Models
sdata <- simglm(family="poisson",lambda=4)
fitf <- glm(y~x.1+x.2+x.3,family=poisson,data=sdata$yx)
rsq(fitf)  # type='v'

fitr <- glm(y~x.2+x.3,family=poisson,data=sdata$yx)
rsq(fitr)  # type='v'
rsq(fitr,type='kl')
rsq(fitr,type='lr')
rsq(fitr,type='n')

pcor(fitr)  # type='v'
pcor(fitr,type='kl')
pcor(fitr,type='lr')
pcor(fitr,type='n')

# Gamma models with shape=100
n <- 50
sdata <- simglm(family="Gamma",lambda=4,n=n)
fitf <- glm(y~x.1+x.2+x.3,family=Gamma,data=sdata$yx)
rsq(fitf)  # type='v'
rsq.partial(fitf)  # type='v'

fitr <- glm(y~x.2,family=Gamma,data=sdata$yx)
rsq(fitr)  # type='v'
rsq(fitr,type='kl')
rsq(fitr,type='lr')
rsq(fitr,type='n')

# Likelihood-ratio-based R-squared
y <- sdata$yx$y
yhatr <- fitr$fitted.values
fit0 <- update(fitr,.~1)
yhat0 <- fit0$fitted.values
llr <- sum(log(dgamma(y,shape=100,scale=yhatr/100)))
ll0 <- sum(log(dgamma(y,shape=100,scale=yhat0/100)))

# Likelihood-ratio-based R-squared
1-exp(-2*(llr-ll0)/n)

# Corrected likelihood-ratio-based R-squared
(1-exp(-2*(llr-ll0)/n))/(1-exp(2*ll0/n))



