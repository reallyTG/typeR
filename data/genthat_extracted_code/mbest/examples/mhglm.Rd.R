library(mbest)


### Name: mhglm
### Title: Fitting Moment Hierarchical Generalized Linear Models
### Aliases: mhglm mhglm.fit mhglm_ml mhglm_ml.fit
### Keywords: models regression

### ** Examples

library(lme4)
## The following examples are adapted from lme4:
(fm1 <- mhglm(Reaction ~ Days + (Days | Subject), gaussian, sleepstudy))

(fm2 <- mhglm(Reaction ~ Days + (Days || Subject), gaussian, sleepstudy))

(gm <- mhglm(cbind(incidence, size - incidence) ~ period + (1 | herd),
             data = cbpp, family = binomial))

## The following examples are for multilevel models
g_data <- mhglm_sim(n = 30, m_per_level = c(10, 5, 2), sd_intercept = c(1, 1, 1),
                    sd_slope = c(1, 1, 1), family = "gaussian", seed = 12345)

(m1 <- mhglm_ml(y ~ 1 + x + (1 + x | g1/g2/g3), gaussian, g_data))
# or equivalent
(m2 <- mhglm_ml(y ~ 1 + x + (1 + x | g1) + (1 + x | g2:g1) + (1 + x | g3:g2:g1),
                gaussian, g_data))



