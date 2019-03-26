library(blorr)


### Name: blr_plot_diag_leverage
### Title: Leverage diagnostics plot
### Aliases: blr_plot_diag_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_leverage(model)




