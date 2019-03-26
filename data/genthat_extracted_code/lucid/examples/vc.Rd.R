library(lucid)


### Name: vc
### Title: Extract variance components from mixed models
### Aliases: vc vc.default vc.asreml vc.lme vc.glmerMod vc.lmerMod
###   vc.mcmc.list

### ** Examples


## Not run: 
##D 
##D require("nlme")
##D data(Rail)
##D m3 <- lme(travel~1, random=~1|Rail, data=Rail)
##D vc(m3)
##D ##       effect variance stddev
##D ##  (Intercept)   615.3  24.81
##D ##     Residual    16.17  4.021
##D 
##D require("lme4")
##D m4 <- lmer(travel~1 + (1|Rail), data=Rail)
##D vc(m4)
##D ##      grp        var1 var2   vcov  sdcor
##D ##     Rail (Intercept) <NA> 615.3  24.81
##D ## Residual        <NA> <NA>  16.17  4.021 
##D 
##D require("asreml")
##D ma <- asreml(travel~1, random=~Rail, data=Rail)
##D vc(ma)
##D ##         effect component std.error z.ratio constr
##D ##  Rail!Rail.var    615.3      392.6     1.6    pos
##D ##     R!variance     16.17       6.6     2.4    pos
##D 
##D # See vignette for rjags example
##D 
##D # To change the number of digits, use the print function.
##D print(vc(m3), dig=5)
##D 
## End(Not run)




