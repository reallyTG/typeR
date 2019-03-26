library(longpower)


### Name: lmmpower
### Title: Sample size calculations for linear mixed models of rate of
###   change based on lmer, lme, or gee "placebo" pilot estimates.
### Aliases: lmmpower lmmpower,ANY-method lmmpower,merMod-method
###   lmmpower-methods lmmpower.default lmmpower.gee lmmpower.lme
###   lmmpower.numeric
### Keywords: effects marginal methods mixed model power random sample size

### ** Examples


## Not run: 
##D browseVignettes(package = "longpower")
## End(Not run)

lmmpower(delta=1.5, t = seq(0,1.5,0.25),
	sig2.i = 55, sig2.s = 24, sig2.e = 10, cov.s.i=0.8*sqrt(55)*sqrt(24), power = 0.80)
lmmpower(n=208, t = seq(0,1.5,0.25),
	sig2.i = 55, sig2.s = 24, sig2.e = 10, cov.s.i=0.8*sqrt(55)*sqrt(24), power = 0.80)
lmmpower(beta = 5, pct.change = 0.30, t = seq(0,1.5,0.25),
	sig2.i = 55, sig2.s = 24, sig2.e = 10, cov.s.i=0.8*sqrt(55)*sqrt(24), power = 0.80)

## Not run: 
##D library(lme4)
##D fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
##D lmmpower(fm1, pct.change = 0.30, t = seq(0,9,1), power = 0.80)
##D 
##D library(nlme)
##D fm2 <- lme(Reaction ~ Days, random=~Days|Subject, sleepstudy)
##D lmmpower(fm2, pct.change = 0.30, t = seq(0,9,1), power = 0.80)
##D 
##D # random intercept only
##D fm3 <- lme(Reaction ~ Days, random=~1|Subject, sleepstudy)
##D lmmpower(fm3, pct.change = 0.30, t = seq(0,9,1), power = 0.80)
##D 
##D library(gee)
##D fm4 <- gee(Reaction ~ Days, id = Subject,
##D             data = sleepstudy,
##D             corstr = "exchangeable")
##D lmmpower(fm4, pct.change = 0.30, t = seq(0,9,1), power = 0.80)
## End(Not run)




