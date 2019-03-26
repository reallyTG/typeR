library(blorr)


### Name: blr_plot_c_leverage
### Title: CI Displacement C vs leverage plot
### Aliases: blr_plot_c_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_c_leverage(model)




