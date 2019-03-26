library(robust)


### Name: anova.glmRob
### Title: ANOVA for Robust Generalized Linear Model Fits
### Aliases: anova.glmRob anova.glmRoblist
### Keywords: robust regression methods

### ** Examples

data(breslow.dat)

bres.int <- glmRob(sumY ~ Age10 + Base4*Trt, family = poisson(), data = breslow.dat)
anova(bres.int)

bres.main <- glmRob(sumY ~ Age10 + Base4 + Trt, family = poisson(), data = breslow.dat)
anova(bres.main, bres.int)



