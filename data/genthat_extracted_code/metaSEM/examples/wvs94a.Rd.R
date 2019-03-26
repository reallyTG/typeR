library(metaSEM)


### Name: wvs94a
### Title: Forty-four Studies from Cheung (2013)
### Aliases: wvs94a
### Keywords: datasets

### ** Examples

## Not run: 
##D data(wvs94a)
##D 
##D ## Random-effects model
##D random.ma1 <- meta(y=cbind(lifesat, lifecon),
##D                    v=cbind(lifesat_var, inter_cov, lifecon_var), data=wvs94a,
##D                    model.name="Random effects model")
##D summary(random.ma1)
##D 
##D ## Random-effects model with both population effect sizes fixed at 0
##D random.ma2 <- meta(y=cbind(lifesat, lifecon),
##D                    v=cbind(lifesat_var, inter_cov, lifecon_var), data=wvs94a,
##D                    intercept.constraints=matrix(0, nrow=1, ncol=2),
##D                    model.name="Effect sizes are fixed at 0")
##D summary(random.ma2)
##D 
##D ## Compare the nested models
##D anova(random.ma1, random.ma2)
##D 
##D ## Fixed-effects model by fixing the variance component at 0 
##D fixed.ma <- meta(y=cbind(lifesat, lifecon),
##D                  v=cbind(lifesat_var, inter_cov, lifecon_var), data=wvs94a,
##D                  RE.constraints=matrix(0, ncol=2, nrow=2),
##D                  model.name="Fixed effects model")
##D summary(fixed.ma)
##D 
##D ## Mixed-effects model
##D ## gnp is divided by 10000 and centered by using 
##D ## scale(gnp/10000, scale=FALSE)
##D mixed.ma1 <- meta(y=cbind(lifesat, lifecon),
##D                   v=cbind(lifesat_var, inter_cov, lifecon_var),
##D                   x=scale(gnp/10000, scale=FALSE), data=wvs94a,
##D                   model.name="GNP as a predictor")
##D summary(mixed.ma1)
##D 
##D ## Mixed-effects model with equal regression coefficients
##D mixed.ma2 <- meta(y=cbind(lifesat, lifecon),
##D                   v=cbind(lifesat_var, inter_cov, lifecon_var),
##D                   x=scale(gnp/10000, scale=FALSE), data=wvs94a,
##D                   coef.constraints=matrix(c("0.0*Eq_slope",
##D                                             "0.0*Eq_slope"), nrow=2),
##D                   model.name="GNP as a predictor with equal slope")
##D summary(mixed.ma2)
##D 
##D ## Compare the nested models
##D anova(mixed.ma1, mixed.ma2)
##D 
##D ## Plot the multivariate effect sizes
##D plot(random.ma1, main="Estimated effect sizes and their 95% confidence ellipses",
##D      axis.label=c("Gender difference on life satisfaction",
##D                   "Gender difference on life control"))
## End(Not run)



