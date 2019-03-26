library(blorr)


### Name: blr_plot_difdev_leverage
### Title: Delta deviance vs leverage plot
### Aliases: blr_plot_difdev_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difdev_leverage(model)




