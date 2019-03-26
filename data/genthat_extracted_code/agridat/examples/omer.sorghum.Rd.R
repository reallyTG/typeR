library(agridat)


### Name: omer.sorghum
### Title: Yield of sorghum in 3 years, 2 locations
### Aliases: omer.sorghum
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(omer.sorghum)
##D dat <- omer.sorghum
##D 
##D # REML approach
##D require(lme4)
##D require(lucid)
##D 
##D # 1 loc, 2 years. Match Omer table 1.
##D m1 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
##D            data=subset(dat, is.element(env, c('E2','E4'))))
##D vc(m1)
##D ##      grp        var1 var2    vcov  sdcor
##D ##  gen:env (Intercept) <NA> 17050   130.6
##D ##      gen (Intercept) <NA>  2760    52.54
##D ##  env:rep (Intercept) <NA>   959.1  30.97
##D ## Residual        <NA> <NA> 43090   207.6
##D 
##D # 1 loc, 3 years. Match Omer table 1.
##D m2 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
##D            data=subset(dat, is.element(env, c('E2','E4','E6'))))
##D vc(m2)
##D ##      grp        var1 var2  vcov  sdcor
##D ##  gen:env (Intercept) <NA> 22210 149
##D ##      gen (Intercept) <NA>  9288  96.37
##D ##  env:rep (Intercept) <NA>  1332  36.5
##D ## Residual        <NA> <NA> 40270 200.7
##D 
##D # all 6 locs. Match Omer table 3, frequentist approach
##D m3 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
##D            data=dat)
##D vc(m3)
##D ##       grp        var1 var2  vcov  sdcor
##D ##   gen:env (Intercept) <NA> 21340 146.1
##D ##   env:rep (Intercept) <NA>  1152  33.95
##D ##       gen (Intercept) <NA>  1169  34.2
##D ##  Residual        <NA> <NA> 24660 157
##D 
## End(Not run)



