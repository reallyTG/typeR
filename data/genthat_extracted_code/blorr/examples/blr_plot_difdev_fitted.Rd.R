library(blorr)


### Name: blr_plot_difdev_fitted
### Title: Delta deviance vs fitted values plot
### Aliases: blr_plot_difdev_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difdev_fitted(model)




