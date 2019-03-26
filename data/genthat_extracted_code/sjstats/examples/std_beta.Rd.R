library(sjstats)


### Name: std_beta
### Title: Standardized beta coefficients and CI of linear and mixed models
### Aliases: std_beta std_beta.merMod std_beta.lm std_beta.gls

### ** Examples

# fit linear model
fit <- lm(Ozone ~ Wind + Temp + Solar.R, data = airquality)
# print std. beta coefficients
std_beta(fit)

# print std. beta coefficients and ci, using
# 2 sd and center binary predictors
std_beta(fit, type = "std2")

# std. beta for mixed models
library(lme4)
fit1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
std_beta(fit)




