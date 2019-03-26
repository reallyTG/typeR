library(lmeresampler)


### Name: bootstrap.lmerMod
### Title: Bootstrap Nested Linear Mixed-Effects Models
### Aliases: bootstrap bootstrap.lme bootstrap.lmerMod

### ** Examples

library(lme4) 
vcmodA <- lmer(mathAge11 ~ mathAge8 + gender + class + (1 | school), data = jsp728)

## you can write your own function to return stats, or use something like 'fixef'
mySumm <- function(.) { 
  s <- getME(., "sigma")
    c(beta = getME(., "beta"), sigma = s, sig01 = unname(s * getME(., "theta"))) 
}

## running a parametric bootstrap 
boo1 <- bootstrap(model = vcmodA, fn = mySumm, type = "parametric", B = 100)

## Not run: 
##D ## running a cases bootstrap - only resampling the schools
##D boo2 <- bootstrap(model = vcmodA, fn = mySumm, type = "case", B = 100, resample = c(TRUE, FALSE))
##D 
##D ## running a cases bootstrap - resampling the schools and students within the school
##D boo2 <- bootstrap(model = vcmodA, fn = mySumm, type = "case", B = 100, resample = c(TRUE, FALSE))
##D 
##D ## running a semi-parametric bootstrap
##D boo3 <- bootstrap(model = vcmodA, fn = mySumm, type = "cgr", B = 100)
##D 
##D ## running a residual bootstrap
##D boo4 <- bootstrap(model = vcmodA, fn = mySumm, type = "residual", B = 100)
##D 
##D ## running an REB0 bootstrap
##D boo5 <- bootstrap(model = vcmodA, fn = mySumm, type = "reb", B = 100, reb_typ = 0)
## End(Not run)

## to "look" at it you must have the 'boot' package loaded
require("boot") 
boo1

## you can extract the boostrapped values as a data frame
as.data.frame(boo1)

## bootstrap confidence intervals are easily found using 'boot.ci'
##   warnings about "Some ... intervals may be unstable" go away
##   for larger bootstrap samples
boot.ci(boo1, index = 1, type=c("norm", "basic", "perc"))
boot.ci(boo1, index = 6, type=c("norm", "basic", "perc"))

## you can also examine the bootstrap samples graphically
plot(boo1, index = 1)




