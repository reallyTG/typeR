library(blorr)


### Name: blr_plot_fitted_leverage
### Title: Fitted values vs leverage plot
### Aliases: blr_plot_fitted_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_fitted_leverage(model)




