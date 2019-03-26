library(blorr)


### Name: blr_plot_diag_c
### Title: CI Displacement C plot
### Aliases: blr_plot_diag_c

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_c(model)




