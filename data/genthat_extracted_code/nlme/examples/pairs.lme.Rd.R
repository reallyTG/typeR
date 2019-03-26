library(nlme)


### Name: pairs.lme
### Title: Pairs Plot of an lme Object
### Aliases: pairs.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
# scatter plot of coefficients by gender, identifying unusual subjects
pairs(fm1, ~coef(., augFrame = TRUE) | Sex, id = 0.1, adj = -0.5)    
# scatter plot of estimated random effects
## Not run: 
##D pairs(fm1, ~ranef(.))
## End(Not run)



