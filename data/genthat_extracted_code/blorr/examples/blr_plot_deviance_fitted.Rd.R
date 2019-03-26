library(blorr)


### Name: blr_plot_deviance_fitted
### Title: Deviance vs fitted values plot
### Aliases: blr_plot_deviance_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_deviance_fitted(model)




