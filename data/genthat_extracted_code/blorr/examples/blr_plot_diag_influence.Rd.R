library(blorr)


### Name: blr_plot_diag_influence
### Title: Influence diagnostics plot
### Aliases: blr_plot_diag_influence

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_influence(model)




