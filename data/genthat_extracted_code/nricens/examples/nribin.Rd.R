library(nricens)


### Name: nribin
### Title: NRI for binary models
### Aliases: nribin

### ** Examples

## here consider pbc dataset in survival package as an example
library(survival)
dat = pbc[1:312,]
dat$sex = ifelse(dat$sex=='f', 1, 0)

## subjects censored before 2000 days are excluded
dat = dat[ dat$time > 2000 | (dat$time < 2000 & dat$status == 2), ]

## predciting the event of 'death' before 2000 days
event = ifelse(dat$time < 2000 & dat$status == 2, 1, 0)

## standard prediction model: age, bilirubin, and albumin
z.std = as.matrix(subset(dat, select = c(age, bili, albumin)))

## new prediction model: age, bilirubin, albumin, and protime
z.new = as.matrix(subset(dat, select = c(age, bili, albumin, protime)))

## glm fit (logistic model)
mstd = glm(event ~ ., binomial(logit), data.frame(event, z.std), x=TRUE)
mnew = glm(event ~ ., binomial(logit), data.frame(event, z.new), x=TRUE)

## predicted risk
p.std = mstd$fitted.values
p.new = mnew$fitted.values

## Calculation of risk difference NRI using ('mdl.std', 'mdl.std').
nribin(mdl.std = mstd, mdl.new = mnew, cut = 0.02, niter = 0,
       updown = 'diff')

## Calculation of risk difference NRI using ('event', 'z.std', 'z.std').
nribin(event = event, z.std = z.std, z.new = z.new, cut = 0.02,
       niter = 0, updown = 'diff')

## Calculation of risk difference NRI using ('event', 'p.std', 'p.std').
nribin(event = event, p.std = p.std, p.new = p.new, cut = 0.02,
       niter = 0, updown = 'diff')

## Calculation of risk category NRI using ('mdl.std', 'mdl.std').
nribin(mdl.std = mstd, mdl.new = mnew, cut = c(0.2, 0.4),
       niter = 0, updown = 'category')



