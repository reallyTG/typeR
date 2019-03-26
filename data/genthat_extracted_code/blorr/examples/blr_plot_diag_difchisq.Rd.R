library(blorr)


### Name: blr_plot_diag_difchisq
### Title: Delta chisquare plot
### Aliases: blr_plot_diag_difchisq

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_difchisq(model)




