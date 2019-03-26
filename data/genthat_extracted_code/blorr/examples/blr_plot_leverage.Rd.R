library(blorr)


### Name: blr_plot_leverage
### Title: Leverage plot
### Aliases: blr_plot_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_leverage(model)




