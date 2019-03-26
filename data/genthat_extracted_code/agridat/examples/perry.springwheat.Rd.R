library(agridat)


### Name: perry.springwheat
### Title: Multi-environment trial of wheat cultivars introduced 1860-1982.
### Aliases: perry.springwheat
### Keywords: datasets

### ** Examples


data(perry.springwheat)
dat <- perry.springwheat

library(lattice)
xyplot(yield~yor|env, dat, type=c('p','r'), xlab="year of release",
       main="perry.springwheat")

# Show a table of sites*year
# library(latticeExtra)
# useOuterStrips(xyplot(yield~yor|site*factor(year), dat,
#                       type=c('p','r')))


# Perry reports a rate of gain of 5.8 kg/ha/year.  No model is given.
# We fit a model with separate intercept/slope for each env
m1 <- lm(yield ~ env + yor + env:yor, data=dat)
# Average slope across environments
mean(c(coef(m1)[21], coef(m1)[21]+coef(m1)[22:40]))
## [1] 5.496781

# ----------------------------------------------------------------------------

## Not run: 
##D   # Now a mixed-effects model.  Fixed overall int/slope.  Random env int/slope.
##D 
##D   # First, re-scale response so we don't have huge variances
##D   dat$y <- dat$yield / 100
##D 
##D   require(lme4)
##D   # Use || for uncorrelated int/slope.  Bad model.  See below.
##D   # m2 <- lmer(y ~ 1 + yor + (1+yor||env), data=dat)
##D   ## Warning messages:
##D   ## 1: In checkConv(attr(opt, "derivs"), opt$par, ctrl = control$checkConv,  :
##D   ##   Model failed to converge with max|grad| = 0.55842 (tol = 0.002, component 1)
##D   ## 2: In checkConv(attr(opt, "derivs"), opt$par, ctrl = control$checkConv,  :
##D   ##   Model is nearly unidentifiable: very large eigenvalue
##D   ##  - Rescale variables?;Model is nearly unidentifiable: large eigenvalue ratio
##D   ##  - Rescale variables?
##D 
##D   # Looks like lme4 is having trouble with variance of intercepts
##D   # There is nothing special about 1800 years, so change the
##D   # intercept -- 'correct' yor by subtracting 1800 and try again.
##D   dat$yorc <- dat$yor - 1800
##D   m3 <- lmer(y ~ 1 + yorc + (1+yorc||env), data=dat)
##D   
##D   # Now lme4 succeeds.  Rate of gain is 100*0.0549 = 5.49
##D   fixef(m3)
##D   ## (Intercept)        yorc
##D   ##  5.87492444  0.05494464
##D 
##D   # asreml3
##D   require(asreml)
##D   m3a <- asreml(y ~ 1 + yorc, data=dat, random = ~ env + env:yorc)
##D 
##D   require(lucid)
##D   vc(m3)
##D   ##      grp        var1 var2     vcov   sdcor
##D   ##      env (Intercept) <NA> 11.61    3.407
##D   ##    env.1        yorc <NA>  0.00063 0.02511
##D   ## Residual        <NA> <NA>  3.551   1.884
##D 
##D   vc(m3a)
##D   ##           effect component std.error z.ratio      con
##D   ##      env!env.var  11.61     4.385        2.6 Positive
##D   ## env:yorc!env.var   0.00063  0.000236     2.7 Positive
##D   ##       R!variance   3.551    0.2231      16   Positive
##D 
## End(Not run)

# ----------------------------------------------------------------------------




