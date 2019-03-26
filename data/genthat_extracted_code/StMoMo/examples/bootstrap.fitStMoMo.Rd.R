library(StMoMo)


### Name: bootstrap.fitStMoMo
### Title: Bootstrap a fitted Stochastic Mortality Model
### Aliases: bootstrap.fitStMoMo

### ** Examples

#Long computing times
## Not run: 
##D LCfit <- fit(lc(), data = EWMaleData)
##D 
##D LCResBoot <- bootstrap(LCfit, nBoot = 500, type = "residual")
##D plot(LCResBoot)
##D LCSemiObsBoot <- bootstrap(LCfit, nBoot = 500, type = "semiparametric")
##D plot(LCSemiObsBoot)
##D LCSemiFitBoot <- bootstrap(LCfit, nBoot = 500, type = "semiparametric",  
##D                            deathType = "fitted")
##D plot(LCSemiFitBoot)
## End(Not run)




