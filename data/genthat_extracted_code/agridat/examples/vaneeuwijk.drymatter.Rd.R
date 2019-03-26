library(agridat)


### Name: vaneeuwijk.drymatter
### Title: Dry matter content for Dutch maize varieties in multiple
###   years/sites
### Aliases: vaneeuwijk.drymatter
### Keywords: datasets

### ** Examples


data(vaneeuwijk.drymatter)
dat <- vaneeuwijk.drymatter
dat <- transform(dat, year=factor(year))
dat <- transform(dat, env=factor(paste(year,site)))

if(require(HH)){
  HH::interaction2wt(y ~ year+site+variety,dat,rot=c(90,0),
                     x.between=0, y.between=0,
                     main="vaneeuwijk.drymatter")
}

## Not run: 
##D   # anova model
##D   m1 <- aov(y ~ variety+env+variety:env, data=dat)
##D   anova(m1) # Similar to VanEeuwijk table 2
##D   m2 <- aov(y ~ year*site*variety, data=dat)
##D   anova(m2) # matches Sahai table 5.5
##D 
##D   # variance components model
##D   require(lme4)
##D   require(lucid)
##D   m3 <- lmer(y ~ (1|year) + (1|site) + (1|variety) +
##D                (1|year:site) + (1|year:variety) + (1|site:variety),
##D              data=dat)
##D   vc(m3) # matches Sahai page 266
##D   ##          grp        var1 var2    vcov  sdcor
##D   ## year:variety (Intercept) <NA> 0.3187  0.5645
##D   ##    year:site (Intercept) <NA> 7.735   2.781 
##D   ## site:variety (Intercept) <NA> 0.03502 0.1871
##D   ##         year (Intercept) <NA> 6.272   2.504 
##D   ##      variety (Intercept) <NA> 0.4867  0.6976
##D   ##         site (Intercept) <NA> 6.504   2.55  
##D   ##     Residual        <NA> <NA> 0.8885  0.9426
## End(Not run)




