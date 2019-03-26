library(blorr)


### Name: blr_plot_leverage_fitted
### Title: Leverage vs fitted values plot
### Aliases: blr_plot_leverage_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_leverage_fitted(model)




