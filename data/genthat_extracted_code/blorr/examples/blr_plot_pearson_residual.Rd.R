library(blorr)


### Name: blr_plot_pearson_residual
### Title: Residual values plot
### Aliases: blr_plot_pearson_residual

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_pearson_residual(model)




