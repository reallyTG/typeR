library(secr)


### Name: hcov
### Title: Hybrid Mixture Model
### Aliases: hcov
### Keywords: models

### ** Examples


## Not run: 
##D 
##D ## house mouse dataset, morning trap clearances
##D ## 81 female, 78 male, 1 unknown
##D morning <- subset(housemouse, occ = c(1,3,5,7,9))
##D summary(covariates(morning))
##D 
##D ## speedy model fitting with coarse mask
##D mmask <- make.mask(traps(morning), buffer = 20, nx = 32)
##D 
##D ## assuming equal detection of males and females
##D ## fitted sex ratio p(female) = 0.509434 = 81 / (81 + 78)
##D fit.0 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE)
##D predict(fit.0)
##D 
##D ## allowing sex-specific detection parameters
##D ## this leads to new estimate of sex ratio 
##D fit.h2 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE,
##D     model = list(g0 ~ h2, sigma ~ h2))
##D predict(fit.h2)
##D 
##D ## specifying newdata for h2 - equivalent to predict(fit.h2)
##D predict(fit.h2, newdata = data.frame(h2 = factor(c('f','m'))))
##D 
##D ## conditional likelihood fit of preceding model
##D ## estimate of sex ratio does not change 
##D fit.CL.h2 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE,
##D     CL = TRUE, model = list(g0 ~ h2, sigma ~ h2))
##D predict(fit.CL.h2)
##D 
##D ## did sexes differ in detection parameters?
##D fit.CL.0 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE,
##D     CL = TRUE, model = list(g0 ~ 1, sigma ~ 1))
##D LR.test(fit.CL.h2, fit.CL.0)
##D 
##D ## did sex ratio deviate from 1:1?
##D fit.CL.h2.50 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE,
##D     CL = TRUE, model = list(g0 ~ h2, sigma ~ h2), fixed = list(pmix = 0.5))
##D LR.test(fit.CL.h2, fit.CL.h2.50)
##D 
##D ## did sexes show extra-compensatory variation in lambda0?
##D ## (Efford and Mowat 2014)
##D fit.CL.a0 <- secr.fit(morning, hcov = "sex", mask = mmask, trace = FALSE,
##D     CL = TRUE, model = list(a0 ~ 1, sigma ~ h2))
##D LR.test(fit.CL.h2, fit.CL.a0)
##D 
##D ## trend in ovenbird sex ratio, assuming sex-specific detection
##D omask <- make.mask(traps(ovenCH), buffer = 300, nx = 32)
##D fit.sextrend <- secr.fit(ovenCH, model = list(g0~h2, sigma~h2, pmix~Session),
##D     hcov = "Sex", CL = TRUE, mask = omask, trace = FALSE)
##D predict(fit.sextrend)[1:5]
##D 
## End(Not run)




