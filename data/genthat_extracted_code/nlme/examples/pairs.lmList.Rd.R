library(nlme)


### Name: pairs.lmList
### Title: Pairs Plot of an lmList Object
### Aliases: pairs.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
# scatter plot of coefficients by gender, identifying unusual subjects
pairs(fm1, ~coef(.) | Sex, id = 0.1, adj = -0.5)    
# scatter plot of estimated random effects
## Not run: 
##D pairs(fm1, ~ranef(.))
## End(Not run)



