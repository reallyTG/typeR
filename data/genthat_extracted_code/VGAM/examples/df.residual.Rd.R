library(VGAM)


### Name: df.residual
### Title: Residual Degrees-of-Freedom
### Aliases: df.residual df.residual_vlm
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
head(model.matrix(fit, type = "vlm"))
head(model.matrix(fit, type = "lm"))

df.residual(fit, type = "vlm")  # n * M - p_VLM
nobs(fit, type = "vlm")  # n * M
nvar(fit, type = "vlm")  # p_VLM

df.residual(fit, type = "lm")  # n - p_LM(j); Useful in some situations
nobs(fit, type = "lm")  # n
nvar(fit, type = "lm")  # p_LM
nvar_vlm(fit, type = "lm")  # p_LM(j) (<= p_LM elementwise)



