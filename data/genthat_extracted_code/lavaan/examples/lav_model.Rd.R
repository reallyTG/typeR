library(lavaan)


### Name: lav_model
### Title: lavaan model functions
### Aliases: lav_model_get_parameters lav_model_set_parameters
###   lav_model_implied lav_model_vcov_se

### ** Examples

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
lavmodel <- fit@Model

est <- lav_model_get_parameters(lavmodel)
est



