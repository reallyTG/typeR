library(blorr)


### Name: blr_plot_diag_difdev
### Title: Delta deviance plot
### Aliases: blr_plot_diag_difdev

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_difdev(model)




