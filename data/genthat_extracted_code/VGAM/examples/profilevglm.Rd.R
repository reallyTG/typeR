library(VGAM)


### Name: profilevglm
### Title: Method for Profiling vglm Objects
### Aliases: profilevglm
### Keywords: regression models

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit1 <- vglm(cbind(normal, mild, severe) ~ let, propodds,
             trace = TRUE, data = pneumo)
pfit1 <- profile(fit1, trace = FALSE)
confint(fit1, method = "profile", trace = FALSE)



