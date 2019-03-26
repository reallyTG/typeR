library(blorr)


### Name: blr_decile_lift_chart
### Title: Decile lift chart
### Aliases: blr_decile_lift_chart

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_decile_lift_chart(gt)




