library(MRCV)


### Name: genloglin
### Title: Model the Association Among Two or Three MRCVs
### Aliases: genloglin

### ** Examples

# Estimate the y-main effects model for 2 MRCVs
mod.fit <- genloglin(data = farmer2, I = 3, J = 4, model = "y.main", boot = FALSE)
# Summarize model fit information
summary(mod.fit)
# Examine standardized Pearson residuals
residuals(mod.fit)
# Compare the y-main effects model to the saturated model
anova(mod.fit, model.HA = "saturated", type = "rs2")
# Obtain observed and model-predicted odds ratios
predict(mod.fit)

# Estimate a model that is not one of the named models
# Note that this was the final model chosen by Bilder and Loughin (2007)
mod.fit.other <- genloglin(data = farmer2, I = 3, J = 4, model = count ~ -1 + W:Y + 
    wi%in%W:Y + yj%in%W:Y + wi:yj + wi:yj%in%Y + wi:yj%in%W3:Y1, boot = 
    FALSE)
# Compare this model to the y-main effects model
anova(mod.fit, model.HA = count ~ -1 + W:Y + wi%in%W:Y + yj%in%W:Y + wi:yj + 
    wi:yj%in%Y + wi:yj%in%W3:Y1, type = "rs2", gof = TRUE)

# To obtain bootstrap results from the method functions the genloglin() boot 
# argument must be specified as TRUE (the default)
# A small B is used for demonstration purposes; normally, a larger B should be used
## Not run: 
##D mod.fit <- genloglin(data = farmer2, I = 3, J = 4, model = "y.main", boot = TRUE, 
##D     B = 99)
##D residuals(mod.fit)
##D anova(mod.fit, model.HA = "saturated", type = "all")
##D predict(mod.fit)
##D 
##D # Estimate a model for 3 MRCVs
##D mod.fit.three <- genloglin(data = farmer3, I = 3, J = 4, K = 5, model = count ~ 
##D     -1 + W:Y:Z + wi%in%W:Y:Z + yj%in%W:Y:Z + zk%in%W:Y:Z + wi:yj + 
##D     wi:yj%in%Y + wi:yj%in%W + wi:yj%in%Y:W + yj:zk + yj:zk%in%Z + 
##D     yj:zk%in%Y + yj:zk%in%Z:Y, boot = TRUE, B = 99)
##D residuals(mod.fit.three)
##D anova(mod.fit.three, model.HA = "saturated", type = "all")
##D predict(mod.fit.three, pair = "WY")
## End(Not run)



