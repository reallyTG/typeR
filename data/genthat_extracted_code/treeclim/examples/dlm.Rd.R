library(treeclim)


### Name: dlm
### Title: Dendro-flavoured linear model
### Aliases: dlm

### ** Examples

dlm1 <- dlm(rt_spruce, rt_prec, .sum(6:8), param_names = "summer_prec")
summary(dlm1)

dlm2 <- dlm(rt_spruce, list(rt_prec, rt_temp),
  .sum(6:8, "prec") + .mean(6:8, "temp"), var_names = c("prec", "temp"),
  param_names = c("summer_prec", "summer_temp"))
summary(dlm2)
anova(dlm1, dlm2)



