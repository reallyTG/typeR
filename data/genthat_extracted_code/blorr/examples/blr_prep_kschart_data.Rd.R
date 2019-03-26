library(blorr)


### Name: blr_prep_kschart_data
### Title: KS Chart data
### Aliases: blr_prep_kschart_data blr_prep_kschart_line
###   blr_prep_ksannotate_y blr_prep_kschart_stat blr_prep_ksannotate_x

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_prep_kschart_data(gt)
ks_line <- blr_prep_kschart_line(gt)
blr_prep_kschart_stat(ks_line)
blr_prep_ksannotate_y(ks_line)
blr_prep_ksannotate_x(ks_line)




