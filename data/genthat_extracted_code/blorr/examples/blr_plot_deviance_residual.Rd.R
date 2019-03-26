library(blorr)


### Name: blr_plot_deviance_residual
### Title: Deviance residual values
### Aliases: blr_plot_deviance_residual

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_deviance_residual(model)




