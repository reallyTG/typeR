library(agridat)


### Name: piepho.cocksfoot
### Title: Heading dates for cock's foot on 25 varieties in 7 years
### Aliases: piepho.cocksfoot
### Keywords: datasets

### ** Examples


data(piepho.cocksfoot)
dat <- piepho.cocksfoot
dat$env <- factor(dat$year)

require(lattice)
densityplot(~date|env, data=dat, main="piepho.cocksfoot - heading date") # Gaussian, not gamma distn

## Not run: 
##D   require(lme4)
##D   # A simple mixed model gives results similar to Piepho, Table 2.
##D   m1 <- lmer(date ~ -1 + gen + (1|env), data=dat)
##D   summary(m1)
##D   ## Fixed effects:
##D   ##        Estimate Std. Error t value
##D   ## genG01   48.951      1.744   28.07
##D   ## genG02   42.270      1.755   24.09
##D   ## genG03   45.293      1.744   25.98
##D   ## genG04   45.467      1.744   26.08
##D   ## genG05   44.215      1.755   25.20
## End(Not run)




