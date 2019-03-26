library(blorr)


### Name: blr_plot_difchisq_leverage
### Title: Delta chi square vs leverage plot
### Aliases: blr_plot_difchisq_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difchisq_leverage(model)




