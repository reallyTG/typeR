library(slim)


### Name: slim
### Title: Fit Singular Linear Models
### Aliases: slim

### ** Examples

slim_fit <- slim(renalfn ~ group + month, dialysis)
summary(slim_fit)

if(require("lme4")) {
  lmer_fit <- lmer(renalfn ~ group + month + (1 + month | id), dialysis)
  slim_fit <- slim(renalfn ~ 1 + group + month, dialysis, covariance = lmer_fit)
  summary(slim_fit)
  summary(slim_fit, empirical = FALSE)
}

if(require("jmcm")) {
  jmcm_fit <- jmcm(renalfn | id | month ~ group | 1, dialysis,
    triple = rep(2L, 3), cov.method = "mcd")
  slim_fit <- slim(renalfn ~ group + month, dialysis, covariance = jmcm_fit)
  summary(slim_fit)
  summary(slim_fit, empirical = FALSE)
}



