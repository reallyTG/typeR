library(blorr)


### Name: blr_plot_diag_fit
### Title: Fitted values diagnostics plot
### Aliases: blr_plot_diag_fit

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_fit(model)




