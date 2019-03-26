library(blorr)


### Name: blr_roc_curve
### Title: ROC curve
### Aliases: blr_roc_curve

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
k <- blr_gains_table(model)
blr_roc_curve(k)




