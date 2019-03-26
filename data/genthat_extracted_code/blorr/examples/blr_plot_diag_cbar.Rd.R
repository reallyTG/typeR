library(blorr)


### Name: blr_plot_diag_cbar
### Title: CI Displacement CBAR plot
### Aliases: blr_plot_diag_cbar

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_cbar(model)




