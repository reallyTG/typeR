library(agridat)


### Name: gomez.multilocsplitplot
### Title: Multi-environment trial of rice, split-plot design
### Aliases: gomez.multilocsplitplot

### ** Examples


data(gomez.multilocsplitplot)
dat <- gomez.multilocsplitplot
dat$nf <- factor(dat$nitro)

# Gomez figure 8.3
require(lattice)
xyplot(yield~nitro, dat, group=loc, type=c('p','smooth'), auto.key=TRUE,
       main="gomez.multilocsplitplot")

# AOV
# Be careful to use the right stratum, 'nf' appears in both strata.
# Still not quite the same as Gomez table 8.21
t1 <- terms(yield ~ loc * nf * gen + Error(loc:rep:nf),
            "Error", keep.order=TRUE)
m1 <- aov(t1, data=dat)
summary(m1)

## Not run: 
##D   # F values are somewhat similar to Gomez Table 8.21
##D   require(lme4)
##D   m2 <- lmer(yield ~ loc*nf*gen + (1|loc/rep/nf), dat)
##D   anova(m2)
##D   ## Analysis of Variance Table
##D   ##            Df   Sum Sq  Mean Sq F value
##D   ## loc         2   117942    58971  0.1525
##D   ## nf          5 72841432 14568286 37.6777
##D   ## gen         1  7557570  7557570 19.5460
##D   ## loc:nf     10 10137188  1013719  2.6218
##D   ## loc:gen     2  4270469  2135235  5.5223
##D   ## nf:gen      5  1501767   300353  0.7768
##D   ## loc:nf:gen 10  1502273   150227  0.3885
## End(Not run)




