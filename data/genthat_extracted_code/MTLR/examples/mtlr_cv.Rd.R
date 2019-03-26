library(MTLR)


### Name: mtlr_cv
### Title: MTLR Internal Cross-Validation for Selecting C1.
### Aliases: mtlr_cv

### ** Examples

library(survival)
cv_mod <- mtlr_cv(Surv(time,status)~., data = lung)
#Note the best C1 also corresponds to the lost average loss:
cv_mod



