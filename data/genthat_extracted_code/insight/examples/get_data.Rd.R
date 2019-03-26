library(insight)


### Name: get_data
### Title: Get the data that was used to fit the model
### Aliases: get_data get_data.hurdle get_data.glmmTMB get_data.merMod
###   get_data.clmm get_data.lme get_data.gee get_data.MixMod
###   get_data.MCMCglmm

### ** Examples

data(cbpp, package = "lme4")
cbpp$trials <- cbpp$size - cbpp$incidence
m <- glm(cbind(incidence, trials) ~ period, data = cbpp, family = binomial)
head(get_data(m))



