library(mirt)


### Name: LSAT6
### Title: Description of LSAT6 data
### Aliases: LSAT6
### Keywords: data

### ** Examples


## Not run: 
##D dat <- expand.table(LSAT6)
##D head(dat)
##D model <- 'F = 1-5
##D          CONSTRAIN = (1-5, a1)'
##D (mod <- mirt(dat, model))
##D M2(mod)
##D itemfit(mod)
##D coef(mod, simplify=TRUE)
##D 
##D #equivalentely, but with a different parameterization
##D mod2 <- mirt(dat, 1, itemtype = 'Rasch')
##D anova(mod, mod2) #equal
##D M2(mod2)
##D itemfit(mod2)
##D coef(mod2, simplify=TRUE)
##D sqrt(coef(mod2)$GroupPars[2]) #latent SD equal to the slope in mod
##D 
## End(Not run)



