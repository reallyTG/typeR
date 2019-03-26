library(blorr)


### Name: blr_residual_diagnostics
### Title: Residual diagnostics
### Aliases: blr_residual_diagnostics

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_residual_diagnostics(model)




