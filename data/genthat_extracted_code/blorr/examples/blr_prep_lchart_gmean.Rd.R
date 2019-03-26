library(blorr)


### Name: blr_prep_lchart_gmean
### Title: Lift Chart data
### Aliases: blr_prep_lchart_gmean blr_prep_lchart_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
globalmean <- blr_prep_lchart_gmean(gt)
blr_prep_lchart_data(gt, globalmean)




