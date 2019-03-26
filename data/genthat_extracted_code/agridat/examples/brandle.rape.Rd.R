library(agridat)


### Name: brandle.rape
### Title: Multi-environment trial of rape
### Aliases: brandle.rape
### Keywords: datasets

### ** Examples


data(brandle.rape)
dat <- brandle.rape

require(lattice)
dotplot(gen~yield|loc, dat, group=year, auto.key=list(columns=3),
        main="brandle.rape, yields per location", ylab="Genotype")

# Matches table 4 of Brandle
round(tapply(dat$yield, dat$gen, mean),0)

## Not run: 
##D   # Brandle reports variance components:
##D   # sigma^2_gl: 9369  gy: 14027 g: 72632 resid: 150000
##D   # Brandle analyzed rep-level data, so the residual variance is different.
##D   # The other components are matched by the following analysis.
##D   
##D   require(lme4)
##D   require(lucid)
##D   dat$year <- factor(dat$year)
##D   m1 <- lmer(yield ~ year + loc + year:loc + (1|gen) +
##D                (1|gen:loc) + (1|gen:year), data=dat)
##D   vc(m1)
##D   ##      grp        var1 var2  vcov  sdcor
##D   ##  gen:loc (Intercept) <NA>  9363  96.76
##D   ## gen:year (Intercept) <NA> 14030 118.4
##D   ##      gen (Intercept) <NA> 72630 269.5
##D   ## Residual        <NA> <NA> 75010 273.9
##D   
## End(Not run)






