library(blorr)


### Name: blr_prep_roc_data
### Title: ROC curve data
### Aliases: blr_prep_roc_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_prep_roc_data(gt)




