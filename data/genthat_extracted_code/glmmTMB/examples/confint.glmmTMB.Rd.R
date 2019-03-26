library(glmmTMB)


### Name: confint.glmmTMB
### Title: Calculate confidence intervals
### Aliases: confint.glmmTMB

### ** Examples

data(sleepstudy, package="lme4")
model <- glmmTMB(Reaction ~ Days + (1|Subject), sleepstudy)
model2 <- glmmTMB(Reaction ~ Days + (1|Subject), sleepstudy,
    dispformula= ~I(Days>8))
confint(model)  ## Wald/delta-method CIs
confint(model,parm="theta_")  ## Wald/delta-method CIs
confint(model,parm=1,method="profile")



