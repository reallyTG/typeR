library(agridat)


### Name: battese.survey
### Title: Survey and satellite data for corn and soy areas in Iowa
### Aliases: battese.survey
### Keywords: datasets

### ** Examples

data(battese.survey)
dat <- battese.survey

# Battese fig 1 & 2.  Corn plot shows outlier in Hardin county
library("lattice")
dat <- dat[order(dat$cornpix),]
xyplot(cornhect ~ cornpix, data=dat, group=county, type=c('p','l'),
       main="battese.survey", xlab="Pixels of corn", ylab="Hectares of corn",
       auto.key=list(columns=3))

## Not run: 
##D   dat <- dat[order(dat$soypix),]
##D   xyplot(soyhect ~ soypix, data=dat, group=county, type=c('p','l'),
##D          main="battese.survey", xlab="Pixels of soy", ylab="Hectares of soy",
##D          auto.key=list(columns=3))
## End(Not run)

## Not run: 
##D   require("lme4")
##D   require("lucid")
##D   
##D   # Fit the models of Battese 1982, p.18.  Results match
##D   m1 <- lmer(cornhect ~ 1 + cornpix + (1|county), data=dat)
##D   fixef(m1)
##D   ## (Intercept)     cornpix 
##D   ##   5.4661899   0.3878358 
##D   vc(m1)
##D   ##      grp        var1 var2   vcov  sdcor
##D   ##   county (Intercept) <NA>  62.83  7.926
##D   ## Residual        <NA> <NA> 290.4  17.04 
##D   m2 <- lmer(soyhect ~ 1 + soypix + (1|county), data=dat)
##D   fixef(m2)
##D   ## (Intercept)      soypix 
##D   ##  -3.8223566   0.4756781 
##D   vc(m2)
##D   ##      grp        var1 var2  vcov sdcor
##D   ##   county (Intercept) <NA> 239.2 15.47
##D   ## Residual        <NA> <NA> 180   13.42
##D   
##D   # Predict for Humboldt county as in Battese 1982 table 2
##D   5.4662+.3878*290.74
##D   # 118.2152 # mu_i^0
##D   5.4662+.3878*290.74+ -2.8744
##D   # 115.3408 # mu_i^gamma
##D   (185.35+116.43)/2
##D   # 150.89 # y_i bar
##D   
##D   # Survey regression estimator of Battese 1988
##D   
##D   # Delete the outlier
##D   dat2 <- subset(dat, !(county=="Hardin" & soyhect < 30))
##D   
##D   # Results match top-right of Battese 1988, p. 33
##D   m3 <- lmer(cornhect ~ cornpix + soypix + (1|county), data=dat2)
##D   fixef(m3)
##D   ## (Intercept)     cornpix      soypix 
##D   ##  51.0703979   0.3287217  -0.1345684 
##D   vc(m3)
##D   ##      grp        var1 var2  vcov sdcor
##D   ##   county (Intercept) <NA> 140   11.83
##D   ## Residual        <NA> <NA> 147.3 12.14
##D   m4 <- lmer(soyhect ~ cornpix + soypix + (1|county), data=dat2)
##D   fixef(m4)
##D   ##  (Intercept)      cornpix       soypix 
##D   ## -15.59027098   0.02717639   0.49439320 
##D   vc(m4)
##D   ##      grp        var1 var2  vcov sdcor
##D   ##   county (Intercept) <NA> 247.5 15.73
##D   ## Residual        <NA> <NA> 190.5 13.8 
## End(Not run)




