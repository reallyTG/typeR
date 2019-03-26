library(rsq)


### Name: rsq.partial
### Title: Partial R-Squared for Generalized Linear Models
### Aliases: rsq.partial
### Keywords: regression

### ** Examples

data(hcrabs)
attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq.partial(bnfit)

bnfitr <- glm(y~color+weight,family=binomial)
rsq.partial(bnfit,bnfitr)

quasibn <- glm(y~color+spine+width+weight,family=quasibinomial)
rsq.partial(quasibn)

quasibnr <- glm(y~color+weight,family=binomial)
rsq.partial(quasibn,quasibnr)



