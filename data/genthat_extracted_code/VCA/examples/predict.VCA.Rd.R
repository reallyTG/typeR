library(VCA)


### Name: predict.VCA
### Title: Predictions from a Model Fitted by 'fitLMM'.
### Aliases: predict.VCA

### ** Examples

## Not run: 
##D # fit LMM with fixed lot and device effects and test for lot-differences
##D data(VCAdata1)
##D datS5 <- subset(VCAdata1, sample==5)
##D fitS5 <- fitLMM(y~(lot+device)/(day)/(run), datS5, "anova")
##D fitS5
##D 
##D # fitted values including fixed and random effects
##D pred0 <- predict(fitS5)
##D pred0
##D # sanity check:
##D all(round(pred0 + resid(fitS5) - datS5$y, 12) == 0)
##D # restrict to fixed effects
##D predict(fitS5, re=NA)
##D # restrict to fixed effects and dayly random effects
##D # see required names
##D fitS5$random
##D predict(fitS5, re="lot:device:day")
##D 
##D # check against original 'lmer'-predictions
##D # use version from VCA-package (ordinary data.frame)
##D data(Orthodont, package="VCA")
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age-11
##D # use exactly the same data, same ordering
##D Ortho <- orderData(Ortho, distance ~ Sex * age2 + (Subject) * age2)
##D fit.fitLMM <- fitLMM(distance ~ Sex * age2 + (Subject) * age2, Ortho, "reml")
##D library(lme4)
##D fit.lmer <- lmer(distance ~ Sex + age2 + Sex:age2 + (age2 | Subject), Ortho)
##D # check fitted value first (fixed + random effects)
##D predict(fit.lmer)
##D predict(fit.fitLMM)
##D # restrict to fixed part only
##D predict(fit.lmer, re.form=NA)  
##D predict(fit.fitLMM, re=NA)
##D # user-specified 'newdata'
##D newdata <- Ortho[45:54,]
##D newdata$age2 <- newdata$age2 + 5
##D # include fixed and random effects
##D predict(fit.lmer, newdata)
##D predict(fit.fitLMM, newdata)
##D # generate new data
##D newdata <- Ortho[45:54,]          
##D newdata$age2 <- newdata$age2 + 5
##D # predict on newdata using fixed and random effects
##D predict(fit.lmer, newdata) 
##D predict(fit.fitLMM, newdata)       
##D # restrict prediction to random Subject effects
##D predict(fit.lmer, newdata, re.form=~(1|Subject))        
##D predict(fit.fitLMM, newdata, re="Subject")
##D # restrict prediction to random per-Subject slope
##D predict(fit.lmer, newdata, re.form=~(age2-1|Subject)) 
##D predict(fit.fitLMM, newdata, re="age2:Subject")
## End(Not run)



