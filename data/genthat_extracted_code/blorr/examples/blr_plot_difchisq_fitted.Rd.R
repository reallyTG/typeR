library(blorr)


### Name: blr_plot_difchisq_fitted
### Title: Delta chi square vs fitted values plot
### Aliases: blr_plot_difchisq_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difchisq_fitted(model)




