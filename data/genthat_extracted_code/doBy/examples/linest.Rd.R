library(doBy)


### Name: summary.esticon_class
### Title: Compute linear estimates
### Aliases: summary.esticon_class linest linest.lm linest.glm
###   linest.geeglm linest.lmerMod linest.merMod linest.default
###   coef.linest_class summary.linest_class confint.linest_class
### Keywords: utilities

### ** Examples



## Make balanced dataset
dat.bal <- expand.grid(list(AA=factor(1:2), BB=factor(1:3), CC=factor(1:3)))
dat.bal$y <- rnorm(nrow(dat.bal))

## Make unbalanced dataset
#   'BB' is nested within 'CC' so BB=1 is only found when CC=1
#   and BB=2,3 are found in each CC=2,3,4
dat.nst <- dat.bal
dat.nst$CC <-factor(c(1,1,2,2,2,2,1,1,3,3,3,3,1,1,4,4,4,4))

mod.bal  <- lm(y ~ AA + BB * CC, data=dat.bal)
mod.nst  <- lm(y ~ AA + BB : CC, data=dat.nst)

L <- LE_matrix(mod.nst, effect=c("BB", "CC"))
linest( mod.nst, L )




