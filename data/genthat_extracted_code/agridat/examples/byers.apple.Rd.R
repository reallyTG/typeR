library(agridat)


### Name: byers.apple
### Title: Diameters of apples
### Aliases: byers.apple
### Keywords: datasets

### ** Examples

data(byers.apple)
dat <- byers.apple

require(lattice)
xyplot(diameter ~ time | factor(appleid), data=dat, type=c('p','l'),
       strip=strip.custom(par.strip.text=list(cex=.7)),
       main="byers.apple")

## Not run: 
##D   # Overall fixed linear trend, plus random intercept/slope deviations
##D   # for each apple.  Observations within each apple are correlated.
##D   require(nlme)
##D   require(lucid)
##D   m1 <- lme(diameter ~ 1 + time, data=dat,
##D             random = ~ time|appleid, method='ML',
##D             cor = corAR1(0, form=~ time|appleid),
##D             na.action=na.omit)
##D   vc(m1)
##D   ##       effect   variance   stddev corr
##D   ##  (Intercept) 0.007354   0.08575    NA
##D   ##         time 0.00003632 0.006027 0.83
##D   ##     Residual 0.0004555  0.02134    NA
## End(Not run)




