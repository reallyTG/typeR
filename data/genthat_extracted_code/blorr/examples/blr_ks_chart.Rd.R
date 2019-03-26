library(blorr)


### Name: blr_ks_chart
### Title: KS chart
### Aliases: blr_ks_chart

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_ks_chart(gt)




