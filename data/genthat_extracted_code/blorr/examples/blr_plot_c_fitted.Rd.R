library(blorr)


### Name: blr_plot_c_fitted
### Title: CI Displacement C vs fitted values plot
### Aliases: blr_plot_c_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_c_fitted(model)




